FROM alpine:latest as compiler

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing chez-scheme

WORKDIR /code
COPY ./hello.sch /code/
CMD ["chez", "--script", "hello.sch"]