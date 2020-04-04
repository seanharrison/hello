FROM golang as compiler 
COPY ./hello.go .
RUN CGO_ENABLED=0 go build -a -ldflags -s hello.go
FROM scratch 
COPY --from=compiler /go/hello .
CMD ["./hello"]
