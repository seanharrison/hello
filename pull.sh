#!/bin/bash
for image in \
    alpine:3.13 \
    alpine:latest \
    crystallang/crystal:latest-alpine \
    debian:bullseye-slim \
    elixir:latest \
    golang:latest \
    julia:latest \
    nimlang/nim:alpine \
    rust:latest \
    utdemir/ghc-musl:v24-ghc884 
do 
    docker pull $image
done
