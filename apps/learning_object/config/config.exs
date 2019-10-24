use Mix.Config

config :learning_object, Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon_learning_object",
  username: "aj",
  password: "aj"

config :learning_object, ecto_repos: [Repo]

import_config "commanded.exs"
