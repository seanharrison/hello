FROM alpine:latest as compiler

WORKDIR /code
COPY ./hello.cl ./build.cl /code/
RUN apk update \
    && apk add g++ ecl ecl-dev gmp-dev gc-dev libffi-dev
    
RUN ecl --load build.cl

CMD ["/code/hello"]

FROM alpine:latest
COPY --from=compiler /code/hello /hello
RUN apk update \
    && apk add ecl
CMD ["/hello"]
