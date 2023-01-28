#!/bin/bash

if [ "${1:-}" ]; then
    time docker run seanharrison/hello:$1
else
    for f in $(ls -d */ | cut -f1 -d'/'); do
        targets=$(cat $f/targets || echo -n "")
        if [ "${targets}" ]; then
            for target in $targets; do
                echo "-- $f-$target --"
                time docker run seanharrison/hello:$f-$target
            done
        else
            echo "-- $f --"
            time docker run seanharrison/hello:$f
        fi
    done
fi
