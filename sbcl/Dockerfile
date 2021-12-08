FROM alpine:latest as compiler

WORKDIR /code
RUN apk update && apk add sbcl upx
COPY ./hello.cl /code

# FROM scratch
# COPY --from=compiler /code/hello /hello
# CMD ["/hello"]
