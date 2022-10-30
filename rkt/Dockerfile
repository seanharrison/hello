FROM debian:bullseye-slim AS build
WORKDIR /code
COPY ./hello.rkt ./
RUN apt update && apt install -y wget
RUN wget -q https://download.racket-lang.org/installers/8.6/racket-8.6-x86_64-linux-cs.sh \
    && chmod +x racket-8.6-x86_64-linux-cs.sh \
    && ./racket-8.6-x86_64-linux-cs.sh --unix-style --dest /usr/local
RUN raco exe hello.rkt \
    && raco distribute hello.pkg hello

FROM debian:bullseye-slim AS deploy
COPY --from=build /code/hello.pkg/ /hello/
CMD ["/hello/bin/hello"]
