#!/bin/bash

# build docker image
docker build -t arifnd/karsajobs-ui:latest .


# login to docker hub
echo $PASSWORD_DOCKER_HUB | docker login -u arifnd --password-stdin

# push images
docker push arifnd/karsajobs-ui:latest