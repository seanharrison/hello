FROM elixir:1.14-alpine as build

WORKDIR /app
COPY ./ ./
RUN MIX_ENV=prod mix escript.build

FROM erlang:alpine as prod
COPY --from=build /app/hello /hello
CMD ["/hello"]
