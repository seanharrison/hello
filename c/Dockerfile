FROM alpine:latest as alpine-build

RUN apk update && apk add gcc libc-dev

WORKDIR /code
COPY ./hello.c /code
RUN gcc -s -static-pie -o hello-static hello.c
RUN gcc -o hello-linked hello.c 

FROM alpine:latest as alpine
COPY --from=alpine-build /code/hello-linked /hello
CMD ["/hello"]

FROM scratch as static
COPY --from=alpine-build /code/hello-static /hello
CMD ["/hello"]
