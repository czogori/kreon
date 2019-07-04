defmodule User.Mixfile do
  use Mix.Project

  def project do
    [
      app: :user,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :database], mod: {User.Application, []}]
  end

  defp deps do
    [
      {:infrastructure, in_umbrella: true},
      {:database, in_umbrella: true},
      {:comeonin, "~> 4.0"},
      {:argon2_elixir, "~> 1.2"}
    ]
  end
end
