#!/bin/bash

# build docker image
docker build -t ghcr.io/arifnd/shipping-service:latest .

# login to github container registry
echo $GHCR_TOKEN | docker login ghcr.io -u arifnd --password-stdin

# push images
docker push ghcr.io/arifnd/shipping-service:latest
