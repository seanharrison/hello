FROM alpine:latest AS compiler

WORKDIR /code
RUN apk add gcc git make musl-dev
RUN git clone https://github.com/vlang/v
RUN cd v && make && cd ..
COPY hello.v /code/
RUN v/v -b native hello.v

FROM scratch AS run
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
