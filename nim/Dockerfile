FROM nimlang/nim:alpine as compiler

RUN apk update && apk add upx
WORKDIR /code
COPY . /code
RUN nim c -d:release --passL:"-static -no-pie" hello.nim \
    && upx hello

FROM scratch as static
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
