#!/bin/bash 

set -euo pipefail

#Install other pre-reqs
yum install java-17-amazon-corretto docker nano git -y

#Give permission to ec2-user for using docker 
usermod -a -G docker ec2-user

#Installing docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

mkdir -p $DOCKER_CONFIG/cli-plugins

curl -SL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

#Give everyone permission to 
chmod 777 $DOCKER_CONFIG/cli-plugins/docker-compose