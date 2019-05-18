defmodule Kreon.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      reset: [
        "ecto.drop",
        "ecto.create",
        "event_store.drop",
        "event_store.create",
        "event_store.init",
        "ecto.migrate -r Repo",
        "run -r apps/user/priv/repo/seeds.exs",
        "run -r apps/learning_object/priv/repo/seeds.exs"
      ]
    ]
  end
end
