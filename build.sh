#!/bin/bash

for f in c d go nim rust
do cd $f
    echo $f
    time docker build . -t seanharrison/hello:$f
    cd ..
done
docker image ls | grep seanharrison/hello
docker push seanharrison/hello
