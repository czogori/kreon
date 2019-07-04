defmodule Database.Mixfile do
  use Mix.Project

  def project do
    [
      app: :database,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [extra_applications: [:logger], mod: {Database, []}]
  end

  defp deps do
    [
      {:ecto, "~> 3.1.0", override: true},
      {:ecto_sql, "~> 3.1.0"},
      {:postgrex, ">= 0.14.0"},
      {:commanded, "0.19.0"},
      {:commanded_ecto_projections, "~> 0.8"},
      {:commanded_eventstore_adapter, "0.6.0"}
    ]
  end

  defp aliases do
    [
      seed: "run priv/repo/seeds.exs"
    ]
  end
end
