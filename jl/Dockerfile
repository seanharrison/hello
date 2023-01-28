FROM julia:1.8-alpine3.16 as compiler

RUN apk add upx

COPY ./hello.jl .
# RUN CGO_ENABLED=0 go build -a -ldflags "-s -w" hello.go \
#     && upx hello

# FROM scratch as static
# COPY --from=compiler /go/hello .
# CMD ["./hello"]
