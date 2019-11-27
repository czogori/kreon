defmodule User.Mixfile do
  use Mix.Project

  def project do
    [
      app: :user,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {User.Application, []}]
  end

  defp deps do
    [
      {:argon2_elixir, "~> 2.0"},
      {:comeonin, "~> 5.0"},
      {:ecto, "~> 3.1.0", override: true},
      {:ecto_sql, "~> 3.1.0"},
      {:jason, "~> 1.1"},
      {:postgrex, ">= 0.14.0"},
      {:phoenix_pubsub_redis, "~> 2.1.0"}
    ]
  end
end
