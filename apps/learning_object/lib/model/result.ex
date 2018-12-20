defmodule Kreon.LearningObject.Model.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "result" do
    field :learning_object_id, :integer
    field :user_id, :binary_id
    field :status, :string
    field :score, :integer, default: 0
    field :time, :integer, default: 0
    field :progress, :integer, default: 0
    timestamps()
  end

  @required ~w(learning_object_id user_id)a

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, ~w(learning_object_id user_id status score time progress))
    |> validate_required(@required)
    # |> validate_length(:login, min: 2, max: 20)
    # |> unique_constraint(:login)
  end
end