######################################
# Based on Ubuntu image
######################################
FROM ubuntu:18.04

######################################
# Basic project infos
######################################
LABEL maintainer="InfraQuiz Executor"

######################################
# Update Ubuntu apt and install some tools
######################################
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y git \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

######################################
# Have an own directory for the tool
######################################
RUN mkdir executor
WORKDIR executor

######################################
# Download Pharo using Zeroconf & start script
######################################
RUN wget -O- https://get.pharo.org/64/70+vm | bash

COPY load.st load.st

RUN ./pharo Pharo.image load.st

######################################
# Expose port 40422 of Seamless outside the container
######################################
EXPOSE 40422

######################################
# Finally run headless as server
######################################
CMD ./pharo --headless Pharo.image --no-quit
