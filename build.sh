#!/bin/bash

for f in $(ls -d */ | cut -f1 -d'/'); do
    cd $f
    echo $f
    time docker build . -t seanharrison/hello:$f
    cd ..
done
$(dirname $0)/ls.sh
