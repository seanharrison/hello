FROM alpine:latest as compiler

RUN apk update && apk add ldc gcc libc-dev upx

WORKDIR /code
COPY . /code
RUN ldc2 --static -O --release hello.d
RUN upx hello

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
