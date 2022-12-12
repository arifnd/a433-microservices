#!/bin/bash

# build docker image
docker build -t item-app:v1 .

# list all docker images
docker images

# rename images before push to GitHub Packages
docker image tag item-app:v1 arifnd/item-app:v1

# login to GitHub Packages
echo $PASSWORD_DOCKER_HUB | docker login -u arifnd --password-stdin

# push images
docker push arifnd/item-app:v1
