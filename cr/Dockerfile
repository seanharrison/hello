FROM crystallang/crystal:latest-alpine as compiler

RUN apk update \
    && apk add upx

WORKDIR /code
COPY ./hello.cr /code
RUN crystal build hello.cr --release \
    # cannot use --brute -> no output
    && upx -9 hello

FROM compiler AS static-compiler
RUN crystal build hello.cr --release --static \
    && upx -9 hello

FROM alpine:latest as alpine
COPY --from=compiler /code/hello /hello
CMD ["/hello"]

FROM scratch as static
COPY --from=static-compiler /code/hello /hello
CMD ["/hello"]
