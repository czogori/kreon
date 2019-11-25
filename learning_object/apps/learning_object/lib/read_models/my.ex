defmodule LearningObject.ReadModels.My do
  use LearningObject.Schema

  @primary_key false
  schema "my_view" do
    field(:id, :binary_id)
    field(:user_id, :binary_id)
    field(:name, :string)
    timestamps()
  end
end
