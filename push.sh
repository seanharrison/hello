#!/bin/bash
for f in $(ls -d */ | cut -f1 -d'/'); do
    t=seanharrison/hello:$f
    echo $t
    docker push $t
done