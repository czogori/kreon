use Mix.Config

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
