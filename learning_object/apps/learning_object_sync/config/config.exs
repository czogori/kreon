# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :learning_object_sync, Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon_learning_object",
  username: "aj",
  password: "aj"

config :learning_object_sync, ecto_repos: [Repo]
