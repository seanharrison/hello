FROM gerbil/alpine as compiler

WORKDIR /opt/hello/gerbil
RUN apk add upx
COPY ./hello.sc /opt/hello/gerbil
RUN gxc -static -exe -o hello hello.sc \
&& upx hello

FROM alpine as prod
COPY --from=compiler /opt/hello/gerbil/hello /usr/local/bin/hello

CMD ["hello"]