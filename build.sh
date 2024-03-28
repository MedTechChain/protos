#!/usr/bin/env bash

docker build -t medtechchain/proto-build .
docker run --rm -v .:/home/ubuntu -w /home/ubuntu medtechchain/proto-build bash -c 'make javabindings'
