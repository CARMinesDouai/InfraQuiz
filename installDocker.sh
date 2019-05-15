#!/bin/bash

apt-get update
apt-get install -y apt-transport-https ca-certificates  curl software-properties-common gcc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
groupadd docker
usermod -a -G docker $USER
systemctl start docker
systemctl enable docker

reboot
