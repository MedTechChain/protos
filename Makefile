# Inspired from https://github.com/hyperledger/fabric-proto/blob/main/Makefile

SHELL := /usr/bin/env bash -o pipefail

# This controls the location of the cache.
PROJECT := medtechchain-proto

# This controls the version of buf to install and use.
BUF_VERSION := 1.34.0
# If true, Buf is installed from source instead of from releases
BUF_INSTALL_FROM_SOURCE := false

PROTOC_VERSION := 27.2
PROTOC_GEN_DOC_VERSION := 1.5.1
PROTOC_GEN_GRPC_JAVA_VERSION := 1.65.1

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
### For some reason this causes an error because the url becomes
### https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protoc-25.3-linux-aarch64.zip
### instead of https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protoc-25.3-linux-aarch_64.zip 
### missing the underscore between aarch and 64
	PROTOC_ARCH := $(UNAME_ARCH)
endif
ifeq ($(UNAME_OS),Linux)
	PLATFORM := linux
endif

# Buf will be cached to ~/.cache/medtechchain-proto
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

.PHONY: genproto
genproto: deps
	buf generate --template buf.gen.yaml

.PHONY: javabindings
javabindings: genproto
	cd bindings/java && ./gradlew build

.PHONY: javabindings-docker
javabindings-docker:
	if ! docker info >/dev/null 2>&1; then echo "ERROR: Docker is not running"; exit 1; fi
	docker build -t medtechchain/proto-build .
	docker run --rm --user "$(id -u):$(id -g)" -v ".:/home/ubuntu" -w /home/ubuntu medtechchain/proto-build bash -c 'make javabindings'

# clean deletes any files not checked in and the cache for all platforms.
.PHONY: clean
clean:
	@echo "Are you sure you want to run 'git clean -xdf'? This will delete all untracked files and directories, including ignored files."
	@echo "Type 'yes' to proceed, or anything else to abort."
	@read answer && [ "$$answer" = "yes" ] && git clean -xdf || echo "Aborted."

.PHONY: cleandep
cleandep:
	rm -rf $(CACHE_BASE)