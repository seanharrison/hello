FROM utdemir/ghc-musl:v24-ghc884 as build

WORKDIR /build
RUN apk add upx
COPY Main.hs hello.cabal ./
RUN ghc -o hello Main -static -optl-static && upx hello

FROM scratch AS prod
COPY --from=build /build/hello /hello
CMD ["/hello"]
