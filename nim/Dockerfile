FROM nimlang/nim:alpine as compiler

WORKDIR /code
COPY . /code
RUN nim c --passL:"-static -no-pie" hello.nim

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
