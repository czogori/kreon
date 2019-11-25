defmodule LearningObject.ReadModels.Result do
  use LearningObject.Schema

  schema "result" do
    field(:learning_object_id, :binary_id)
    field(:user_id, :binary_id)
    field(:status, :string)
    field(:score, :integer)
    field(:time, :integer)
    timestamps()
  end
end
