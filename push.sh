#!/bin/bash
for f in $(ls -d */ | cut -f1 -d'/'); do
    docker push seanharrison/hello:$f
done