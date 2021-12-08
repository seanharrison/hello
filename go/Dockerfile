FROM golang as compiler

RUN apt-get update && apt-get install -y upx

COPY ./hello.go .
RUN CGO_ENABLED=0 go build -a -ldflags -s hello.go \
    && upx hello

FROM scratch 
COPY --from=compiler /go/hello .
CMD ["./hello"]
