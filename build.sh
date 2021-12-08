#!/bin/bash

for f in $(ls -d */ | cut -f1 -d'/'); do
    cd $f
    echo $f
    time docker build . -t seanharrison/hello:$f
    cd ..
    time docker run --rm seanharrison/hello:$f
done
docker image ls | grep seanharrison/hello | sort
