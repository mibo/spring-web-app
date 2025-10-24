#!/usr/bin/env bash

REPO=mibo/spring-web-app
TAG=latest

# Build the Docker image (with tag 'latest')
docker build . -t ${REPO}:${TAG}

# Check if docker build was successful
if [[ $? -eq 1 ]]; then
  printf "Docker build failed."
  exit
fi

# Push?
printf "\n"
read -t 5 -p "Directly push the build image (y/n)?" check
if [[ "${check}" =~ (y|[[:cntrl:]]) ]]; then
  printf "\nPush...\n"
  docker push ${REPO}:${TAG}
else
  printf "\nSkip pushing the image\n"
fi
