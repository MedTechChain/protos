FROM ubuntu

RUN apt-get update && apt-get install -y make curl unzip golang default-jdk