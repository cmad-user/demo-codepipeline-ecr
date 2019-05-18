#!/usr/bin/env bash

set -e

echo "Removing exiting docker container"
sudo docker stop demo-codepipeline-ecr && docker rm -f demo-codepipeline-ecr | true
echo "Removing exiting docker image"
sudo docker images | grep "demo-codepipeline-ecr" | awk '{print $1":"$2}' | xargs docker rmi | true