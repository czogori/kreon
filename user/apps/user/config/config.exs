use Mix.Config

config :user, Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kreon_user",
  username: "aj",
  password: "aj"

config :user, ecto_repos: [Repo]
