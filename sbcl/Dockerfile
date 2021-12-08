FROM alpine:latest as compiler

WORKDIR /code
COPY ./hello.cl ./build.cl /code/
RUN apk update \
    && apk add sbcl \
    && sbcl --script build.cl \
    && apk del sbcl 

CMD ["/code/hello"]

FROM alpine:latest
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
