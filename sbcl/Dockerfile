FROM alpine:latest as compiler

WORKDIR /code
COPY ./hello.cl ./build.cl /code/
RUN apk update \
    && apk add sbcl \
    && sbcl --script build.cl 

CMD ["/code/hello"]

FROM alpine:latest as alpine
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
