FROM alpine:latest as compiler

WORKDIR /code
RUN wget https://ziglang.org/download/0.8.1/zig-linux-x86_64-0.8.1.tar.xz \
    && tar xf zig-linux-x86_64-0.8.1.tar.xz 
COPY ./hello.zig /code
RUN zig-linux-x86_64-0.8.1/zig build-exe hello.zig

FROM scratch
COPY --from=compiler /code/hello /hello
CMD ["/hello"]
