FROM golang as compiler

RUN apt-get update && apt-get install -y upx

COPY ./hello.go .
RUN CGO_ENABLED=0 go build -a -ldflags "-s -w" hello.go \
    && upx hello

FROM scratch as static
COPY --from=compiler /go/hello .
CMD ["./hello"]
