use Mix.Config

config :user, Kreon.User.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon",
  username: "aj",
  password: "aj"

config :user, ecto_repos: [Kreon.User.Repo]