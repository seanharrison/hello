FROM alpine as script

RUN apk add janet
WORKDIR /code
COPY hello.janet ./
CMD ["janet", "/code/hello.janet"]

FROM alpine as build

WORKDIR /code
RUN apk add gcc git make musl-dev
RUN git clone https://github.com/janet-lang/janet.git \
    && cd janet \
    && make -j \
    && make install \
    && make install-jpm-git \
    && cd /code \
    && rm -rf janet

COPY *.janet ./

RUN jpm build

CMD ["/code/build/hello"]

FROM alpine AS bin
COPY --from=build /code/build/hello /hello
CMD ["/hello"]
