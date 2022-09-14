#!/bin/bash

IMAGE=seanharrison/hello
LANGS=${1:-$(ls -d */ | cut -f1 -d'/')}
for f in $LANGS; do
    cd $f
    echo; echo -- $f --
    targets=$(cat targets || echo -n "")
    if [ "${targets}" ]; then
        for target in $targets; do
            echo $target
            docker build --target $target -t $IMAGE:$f-$target .
            docker history $IMAGE:$f-$target
        done
    else
        docker build -t $IMAGE:$f .
        docker history $IMAGE:$f
    fi
    cd ..
done
