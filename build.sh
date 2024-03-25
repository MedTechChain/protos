#!/usr/bin/env bash

docker run --rm -v .:/home/ubuntu -w /home/ubuntu ubuntu bash -c 'apt-get update && apt-get install -y make curl unzip golang default-jdk && make javabindings'
