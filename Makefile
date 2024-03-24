# Taken and adapted from https://github.com/hyperledger/fabric-protos/blob/main/Makefile

SHELL := /usr/bin/env bash -o pipefail

# This controls the location of the cache.
PROJECT := medtechchain-protos

# This controls the version of buf to install and use.
BUF_VERSION := 1.25.1
# If true, Buf is installed from source instead of from releases
BUF_INSTALL_FROM_SOURCE := false

PROTOC_VERSION := 23.4
PROTOC_GEN_DOC_VERSION := 1.5.1
PROTOC_GEN_GRPC_JAVA_VERSION := 1.57.1

### Everything below this line is meant to be static, i.e. only adjust the above variables. ###

UNAME_OS := $(shell uname -s)
UNAME_ARCH := $(shell uname -m)
ifeq ($(UNAME_OS),Darwin)
	PLATFORM := osx
	ifeq ($(UNAME_ARCH),arm64)
		PROTOC_ARCH := aarch_64
	else
		PROTOC_ARCH := x86_64
	endif
else
	PROTOC_ARCH := $(UNAME_ARCH)
endif
ifeq ($(UNAME_OS),Linux)
	PLATFORM := linux
endif

# Buf will be cached to ~/.cache/medtechchain-protos
CACHE_BASE := $(HOME)/.cache/$(PROJECT)
# This allows switching between i.e a Docker container and your local setup without overwriting.
CACHE := $(CACHE_BASE)/$(UNAME_OS)/$(UNAME_ARCH)
# The location where buf will be installed.
CACHE_BIN := $(CACHE)/bin
# Marker files are put into this directory to denote the current version of binaries that are installed.
CACHE_VERSIONS := $(CACHE)/versions

# Update the $PATH so we can use buf directly
export PATH := $(abspath $(CACHE_BIN)):$(PATH)

# BUF points to the marker file for the installed version.
#
# If BUF_VERSION is changed, the binary will be re-downloaded.
BUF := $(CACHE_VERSIONS)/buf/$(BUF_VERSION)
$(BUF):
	@rm -f $(CACHE_BIN)/buf
	@mkdir -p $(CACHE_BIN)
ifeq ($(BUF_INSTALL_FROM_SOURCE),true)
	$(eval BUF_TMP := $(shell mktemp -d))
	cd $(BUF_TMP); go install github.com/bufbuild/buf/cmd/buf@v$(BUF_VERSION)
	@rm -rf $(BUF_TMP)
else
	curl -sSL \
		"https://github.com/bufbuild/buf/releases/download/v$(BUF_VERSION)/buf-$(UNAME_OS)-$(UNAME_ARCH)" \
		-o "$(CACHE_BIN)/buf"
	chmod +x "$(CACHE_BIN)/buf"
endif
	@rm -rf $(dir $(BUF))
	@mkdir -p $(dir $(BUF))
	@touch $(BUF)

# PROTOC points to the marker file for the installed version.
#
# If PROTOC_VERSION is changed, the binary will be re-downloaded.
PROTOC := $(CACHE_VERSIONS)/protoc/$(PROTOC_VERSION)
$(PROTOC):
	@rm -f $(CACHE_BIN)/protoc
	@mkdir -p $(CACHE_BIN)
	$(eval PROTOC_TMP := $(shell mktemp -d))
	curl -sSL \
		"https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOC_VERSION)/protoc-$(PROTOC_VERSION)-$(PLATFORM)-$(PROTOC_ARCH).zip" \
		-o "$(PROTOC_TMP)/protoc.zip"
	unzip -o "$(PROTOC_TMP)/protoc.zip" -d "$(CACHE)" bin/protoc
	unzip -o "$(PROTOC_TMP)/protoc.zip" -d "$(CACHE)" include/*
	@rm -rf $(PROTOC_TMP)
	chmod +x "$(CACHE_BIN)/protoc"
	@rm -rf $(dir $(PROTOC))
	@mkdir -p $(dir $(PROTOC))
	@touch $(PROTOC)

# PROTOC_GEN_DOC points to the marker file for the installed version.
#
# If PROTOC_GEN_DOC_VERSION is changed, the binary will be re-downloaded.
PROTOC_GEN_DOC := $(CACHE_VERSIONS)/protoc-gen-doc/$(PROTOC_GEN_DOC_VERSION)
$(PROTOC_GEN_DOC):
	@rm -f $(CACHE_BIN)/protoc-gen-doc
	@mkdir -p $(CACHE_BIN)
	$(eval PROTOC_GEN_DOC_TMP := $(shell mktemp -d))
	cd $(PROTOC_GEN_DOC_TMP); GOBIN="$(CACHE_BIN)" go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@v$(PROTOC_GEN_DOC_VERSION)
	@rm -rf $(PROTOC_GEN_DOC_TMP)
	@rm -rf $(dir $(PROTOC_GEN_DOC))
	@mkdir -p $(dir $(PROTOC_GEN_DOC))
	@touch $(PROTOC_GEN_DOC)

# PROTOC_GEN_GRPC_JAVA points to the marker file for the installed version.
#
# If PROTOC_GEN_GRPC_JAVA_VERSION is changed, the binary will be re-downloaded.
PROTOC_GEN_GRPC_JAVA := $(CACHE_VERSIONS)/protoc-gen-grpc-java/$(PROTOC_GEN_GRPC_JAVA_VERSION)
$(PROTOC_GEN_GRPC_JAVA):
	@rm -f $(CACHE_BIN)/protoc-gen-grpc-java
	@mkdir -p $(CACHE_BIN)
	curl -sSL \
		"https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/$(PROTOC_GEN_GRPC_JAVA_VERSION)/protoc-gen-grpc-java-$(PROTOC_GEN_GRPC_JAVA_VERSION)-$(PLATFORM)-$(PROTOC_ARCH).exe" \
		-o "$(CACHE_BIN)/protoc-gen-grpc-java"
	chmod +x "$(CACHE_BIN)/protoc-gen-grpc-java"
	@rm -rf $(dir $(PROTOC_GEN_GRPC_JAVA))
	@mkdir -p $(dir $(PROTOC_GEN_GRPC_JAVA))
	@touch $(PROTOC_GEN_GRPC_JAVA)

.DEFAULT_GOAL := javabindings

# deps allows us to install deps without running any checks.
.PHONY: deps
deps: $(BUF) $(PROTOC) $(PROTOC_GEN_DOC) $(PROTOC_GEN_GRPC_JAVA)

# lint is what we run when testing locally.
# This does breaking change detection against our local git repository.
.PHONY: lint
lint: $(BUF) $(PROTOC)
	buf lint
	buf breaking --against '.git#branch=main'

.PHONY: genprotos
genprotos: deps
	buf generate --template buf.gen.yaml

.PHONY: javabindings
javabindings: genprotos
	cd bindings/java && gradle build

# clean deletes any files not checked in and the cache for all platforms.
.PHONY: clean
clean:
	git clean -xdf

.PHONY: cleandep
cleandep:
	rm -rf $(CACHE_BASE)

# For updating this repository
.PHONY: updateversion
updateversion:
ifndef VERSION
	$(error "VERSION must be set")
else
ifeq ($(UNAME_OS),Darwin)
	sed -i '' "s/BUF_VERSION := [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/BUF_VERSION := $(VERSION)/g" Makefile
else
	sed -i "s/BUF_VERSION := [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/BUF_VERSION := $(VERSION)/g" Makefile
endif
endif