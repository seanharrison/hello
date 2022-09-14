FROM alpine:3.13 as compiler

RUN apk update && apk add ldc gcc libc-dev upx

WORKDIR /code
COPY ./hello.d /code
RUN ldc2 --static -O --release hello.d \
    && upx hello

FROM compiler as alpine-compiler
RUN ldc2 -O --release hello.d 

FROM alpine:3.13 as alpine
COPY --from=alpine-compiler /code/hello /hello
CMD ["/hello"]

FROM scratch as static
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
