defmodule Kreon.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases()]
  end

  defp deps do
    []
  end

  defp aliases do
    [
      setup: [
        "ecto.drop",
        "ecto.create",
        "ecto.migrate -r Kreon.User.Repo -r Kreon.LearningObject.Repo",
        "run -r apps/user/priv/repo/seeds.exs -r apps/learning_object/priv/repo/seeds.exs",
      ]
    ]
  end
end
