#!/bin/bash

# list the images by size
# https://tunzor.github.io/posts/docker-list-images-by-size/
docker image ls --format "{{.Size}}\t{{.Repository}}:{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}" \
    | grep seanharrison/hello | sort -h
