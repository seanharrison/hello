#!/bin/bash

for image in $(docker image ls | grep seanharrison/hello | awk '{print $1 ":" $2}'); do
    echo $image
    docker push $image
done
