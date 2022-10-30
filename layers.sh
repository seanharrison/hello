#!/bin/bash
# This is a different view of the deployment size of images: how big is their added COPY
# layer? Even if the total image is quite large, deployment might only require
# downloading the added layers.

echo -n "" >layers.tmp
for image in $(docker image ls | grep seanharrison/hello | awk '{print $1 ":" $2}'); do
    SIZE=$(docker history $image \
        | grep COPY  \
        | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' \
        | awk '{print $2}')
    echo $SIZE $image | awk '{print $1 "\t" $2}' >>layers.tmp 
done

cat layers.tmp | sort -h
rm layers.tmp
