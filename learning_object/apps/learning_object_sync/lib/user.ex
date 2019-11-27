defmodule LearningObjectSync.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "user" do
    field(:login)
    field(:name)
    field(:surname)

    timestamps()
  end
end
