#!/bin/bash

for f in $(ls -d */ | cut -f1 -d'/'); do
    cd $f
    echo $f
    time docker build . -t seanharrison/hello:$f
    cd ..
    time docker run --rm seanharrison/hello:$f
done
# list the images by size
# https://tunzor.github.io/posts/docker-list-images-by-size/
docker image ls --format "{{.Size}}\t{{.Repository}}:{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}" \
    | grep seanharrison/hello \
    | awk '{if ($1~/MB/) print substr($1, 1, length($1)-2) * 1000 "kB\t" $2 "\t" $3 "\t" $4 " " $5 " " $6 ; else print $1 "\t" $2 "\t" $3 "\t" $4 " " $5 " " $6 }' \
    | sort -n


