FROM crystallang/crystal:latest-alpine as base

RUN apk update \
    && apk add upx

WORKDIR /code
COPY ./hello.cr /code
# RUN crystal build hello.cr --release \
#     # cannot use --brute -> no output
#     && upx -9 hello

FROM base AS static-compiler
RUN crystal build hello.cr --release --static \
    && upx -9 hello

FROM scratch as static
COPY --from=static-compiler /code/hello /hello
CMD ["/hello"]
