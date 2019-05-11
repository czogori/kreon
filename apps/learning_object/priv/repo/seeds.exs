
if Mix.env == :dev do
  alias Kreon.LearningObject

  id = Ecto.UUID.generate
  los = [
    %{
      id: id,
      name: "Lonestar ElixirConf 2018",
      type: "video",
      url: "https://www.youtube.com/watch?v=qhXjq3XU9_I",
      description: "Lonestar ElixirConf 2018"
    },
    %{
      id: Ecto.UUID.generate,
      parent_id: id,
      name: "Keynote - Chris McCord",
      type: "video",
      url: "https://www.youtube.com/watch?v=qhXjq3XU9_I",
      description: "Keynote - Chris McCord"
    },
    %{
      id: Ecto.UUID.generate,
      parent_id: id,
      name: "Why Elixir Matters A Genealogy of Functional Programming",
      type: "video",
      url: "https://www.youtube.com/watch?v=X2u0bBqhRKE",
      description: "Lonestar ElixirConf 2018 - Day 1 Keynote - Chris McCord"
    },

  ]

  for lo <- los, do: LearningObject.create(lo)
end
