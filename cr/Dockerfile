FROM crystallang/crystal:latest-alpine as compiler

RUN apk update \
    && apk add upx

WORKDIR /code
COPY ./hello.cr /code
RUN crystal build hello.cr --release --static \
    # cannot use --brute -> no output
    && upx -9 hello

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
