#!/bin/bash
for image in \
    nimlang/nim:alpine \
    alpine:3.13 \
    crystallang/crystal:latest-alpine \
    golang \
    rust:latest \
    alpine:latest \
    debian:bullseye-slim \
    utdemir/ghc-musl:v24-ghc884
do 
    docker pull $image
done
