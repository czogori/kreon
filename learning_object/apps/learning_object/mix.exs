defmodule LearningObject.Mixfile do
  use Mix.Project

  def project do
    [
      app: :learning_object,
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

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {LearningObject.Application, []}]
  end

  defp deps do
    [
      {:commanded, "0.19.0"},
      {:commanded_ecto_projections, "~> 0.8"},
      {:commanded_eventstore_adapter, "0.6.0"},
      {:ecto, "~> 3.1.0", override: true},
      {:ecto_sql, "~> 3.1.0"},
      {:exconstructor, "~> 1.1.0"},
      {:jason, "~> 1.1"},
      {:postgrex, ">= 0.14.0"},
      {:vex, "~> 0.8.0"}
    ]
  end
end
