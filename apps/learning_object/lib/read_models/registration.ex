defmodule LearningObject.ReadModels.Registration do
  use Kreon.Schema

  schema "registration" do
    field(:learning_object_id, :binary_id)
    field(:user_id, :binary_id)
    timestamps()
  end
end
