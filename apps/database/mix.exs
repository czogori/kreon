defmodule Database.Mixfile do
  use Mix.Project

  def project do
    [app: :database,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {Database, []}]
  end

  defp deps do
    [{:ecto, "~> 2.0"},
     {:postgrex, ">= 0.0.0"}]
  end
end
