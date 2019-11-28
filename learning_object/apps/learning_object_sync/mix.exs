defmodule LearningObjectSync.MixProject do
  use Mix.Project

  def project do
    [
      app: :learning_object_sync,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {LearningObjectSync.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.1.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_pubsub_redis, "~> 2.1.0"},
      {:postgrex, ">= 0.14.0"}
    ]
  end
end
