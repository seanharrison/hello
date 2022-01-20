#!/bin/bash
for image in nimlang/nim:alpine alpine:latest golang rust:latest alpine:latest debian:bullseye-slim
do 
    docker pull $image
done
