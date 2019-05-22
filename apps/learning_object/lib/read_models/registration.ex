defmodule LearningObject.ReadModels.Registration do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "registration" do
    field(:learning_object_id, :binary_id)
    field(:user_id, :binary_id)
    timestamps()
  end
end
