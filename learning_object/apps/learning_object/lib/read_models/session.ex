defmodule LearningObject.ReadModels.Session do
  use LearningObject.Schema

  schema "session" do
    field(:learning_object_id, :binary_id)
    field(:user_id, :binary_id)
    field(:begin, :naive_datetime)
    field(:end, :naive_datetime)
  end
end
