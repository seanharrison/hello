FROM rust:latest as compiler

COPY . /code
WORKDIR /code

# --target x86_64-unknown-linux-musl is required to enable the software to run standalone on scratch
RUN apt-get update && apt-get install -y upx
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --release --target x86_64-unknown-linux-musl \
    && upx /code/target/x86_64-unknown-linux-musl/release/hello

FROM scratch
COPY --from=compiler /code/target/x86_64-unknown-linux-musl/release/hello /hello
CMD ["/hello"]
