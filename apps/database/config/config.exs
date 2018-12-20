# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :database, Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon",
  username: "aj",
  password: "aj"

config :database, ecto_repos: [Repo]
