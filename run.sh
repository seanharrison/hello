#!/bin/bash

if [ "${1:-}" ]; then
    time docker run seanharrison/hello:$1
else
    for f in $(ls -d */ | cut -f1 -d'/'); do
        time docker run seanharrison/hello:$f
    done
fi
