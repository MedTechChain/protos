FROM ubuntu

RUN apt-get update 
RUN apt-get install -y make
RUN apt-get install -y curl 
RUN apt-get install -y unzip 
RUN apt-get install -y golang 
RUN apt-get install -y default-jdk 
RUN apt-get install -y git