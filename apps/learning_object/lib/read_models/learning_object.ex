defmodule LearningObject.ReadModels.LearningObject do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "learning_object" do
    field :type, :string
    field :parent_id, :binary_id
    field :name, :string
    field :url, :string
    field :description, :string
    timestamps()
  end
end
