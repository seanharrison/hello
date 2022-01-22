#!/bin/bash
for image in nimlang/nim:alpine alpine:3.13 golang rust:latest alpine:latest debian:bullseye-slim
do 
    docker pull $image
done
