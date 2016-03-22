FROM msaraiva/elixir-dev:1.2.2

RUN apk --update --no-cache add redis

WORKDIR /code
RUN mix local.hex --force
RUN mix local.rebar --force

ENTRYPOINT ["/code/entrypoint"]
