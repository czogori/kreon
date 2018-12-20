defmodule Kreon.LearningObject.Model.LearningObjectUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "learning_object_user" do
    field :learning_object_id, :binary_id, primary_key: true
    field :user_id, :binary_id, primary_key: true
    timestamps()
  end

  @required ~w(learning_object_id user_id)a

  def changeset(learning_object_user, params \\ %{}) do
    learning_object_user
    |> cast(params, ~w(learning_object_id user_id))
    |> validate_required(@required)
  end
end