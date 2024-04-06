# MedTech Chain proto definitions

## Overview

This repository contains the Protocol Buffer (Protobuf) definitions for MedTech Chain. It includes a Makefile to simplify common development tasks such as compiling Protobuf files, generating language-specific bindings, and maintaining dependencies.

## Repository Structure

- `./bindings`: Contains projects for generating language-specific bindings.
- `./docs`: Contains the exported documentation of the definitions.
- `./schema`: Contains `.proto` files with structured data and service interface definitions.
- `./`: Contains all configurations.

## Development Guide

### Prerequisites

The bindings can be generated using Docker. Generating the bindings without Docker requires:
- make, curl, unzip, golang, git 
- language-specific tools and libraries, depending on the bindings you intend to use (e.g., JDK for Java)

The rest of the dependencies (e.g., protoc, Buf) will be downloaded automatically when calling the Makefile commands.

### Makefile Commands

The repository includes a Makefile that defines several commands to facilitate development and build processes:

- **`make deps`**: Installs or verifies the presence of necessary dependencies. This command is particularly useful when setting up your development environment for the first time or when adding new dependencies.

- **`make lint`**: Runs linters on the codebase to ensure compliance with coding standards and to catch syntax errors.

- **`make genprotos`**: Generates Protobuf files from the `.proto` definitions.

- **`make javabindings`**: Specifically generates Java bindings for the Protobuf definitions.

- **`make javabindings-docker`**: Generates Java bindings using a Docker container, ensuring a consistent build environment.

- **`make clean`**: Cleans up the workspace by removing generated files and artifacts, ensuring a clean slate for the next build. **WARNING**: it removes all unstaged git files.

- **`make cleandep`**: Removes installed dependencies and cleans up related files, which can be useful for refreshing the project's dependencies.

### Versioning

When changing versions, check the followings:
- Makefile
- the build tool configuration file of each bindings project

### Integrating Bindings into Other Projects

To integrate the generated bindings into other projects, you should:

1. Locate the generated binding files in the `/bindings` directory.
2. Include these files in your project's dependencies, ensuring that the project's build system recognizes them.
3. Refer to the specific instructions for each language if integrating bindings for languages other than Java.
