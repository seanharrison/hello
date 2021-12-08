FROM alpine:latest as compiler

RUN apk update && apk add gcc libc-dev

WORKDIR /code
COPY ./hello.c /code
RUN gcc -s -static-pie -o hello hello.c 

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
