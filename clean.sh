#!/bin/bash
for f in $(ls -d */ | cut -f1 -d'/'); do
    targets=$(cat $f/targets || echo -n "")
    if [ "${targets}" ]; then
        for target in $targets; do
            echo "-- $f-$target --"
            docker image rm seanharrison/hello:$f-$target --force
        done
    else
        docker image rm seanharrison/hello:$f --force
    fi
done
