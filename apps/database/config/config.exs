# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :database, Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon",
  username: "aj",
  password: "aj"

config :database, ecto_repos: [Repo]

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: Repo

config :eventstore,
  column_data_type: "jsonb"

config :eventstore, EventStore.Storage,
  serializer: EventStore.JsonbSerializer,
  types: EventStore.PostgresTypes,
  username: "aj",
  password: "aj",
  database: "kreon_eventstore",
  hostname: "localhost",
  pool_size: 10,
  pool_overflow: 5
