#!/bin/sh

# install docker && docker-compose
curl -fsSL https://get.docker.com | bash

curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker `logname`

# get docker-compose.yml
mkdir -p ~/docker-map3
curl -L https://hyperion-deploy.s3-ap-southeast-1.amazonaws.com/edge/docker-compose.yml -o ~/docker-map3/docker-compose.yml

# launch services
docker-compose -f ~/docker-map3/docker-compose.yml up





