FROM alpine:latest as compiler

RUN apk update && apk add gcc-gdc upx

WORKDIR /code
COPY . /code
RUN gdc -static -no-pie -o hello hello.d
RUN upx hello

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
