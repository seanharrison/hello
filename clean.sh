#!/bin/bash
for f in $(ls -d */ | cut -f1 -d'/'); do
    docker image rm seanharrison/hello:$f
done
docker system prune -f
