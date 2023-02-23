FROM debian:bullseye as bullseye-build
WORKDIR /usr/local/src
RUN apt update \
    && apt install -y wget ca-certificates --no-install-suggests --no-install-recommends \
    && wget https://github.com/Clozure/ccl/releases/download/v1.12.1/ccl-1.12.1-linuxx86.tar.gz \
    && tar xzf ccl-1.12.1-linuxx86.tar.gz \
    && cp ccl/scripts/ccl64 /usr/local/bin
WORKDIR /code
COPY ./hello.cl ./build.cl /code/
RUN ccl64 -b -l build.cl

FROM debian:bullseye-slim as bullseye
COPY --from=bullseye-build /code/hello /hello
CMD ["/hello"]

