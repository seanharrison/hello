#!/bin/bash
for f in $(ls -d */ | cut -f1 -d'/'); do
    docker image rm seanharrison/hello:$f --force
done
