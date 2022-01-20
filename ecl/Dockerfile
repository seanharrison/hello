FROM alpine:latest as compiler

WORKDIR /code
RUN apk update \
    && apk add g++ ecl ecl-dev gmp-dev gc-dev libffi-dev
    
COPY ./hello.cl ./build.cl /code/
RUN ecl --load build.cl

CMD ["/code/hello"]

FROM alpine:latest
RUN apk update \
    && apk add ecl
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
