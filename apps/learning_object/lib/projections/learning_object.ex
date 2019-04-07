defmodule LearningObject.Projections.LearningObject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "learning_object" do
    field :type, :string
    field :parent_id, :binary_id
    field :name, :string
    field :url, :string
    field :description, :string
    timestamps()

    #has_many :learnig_obcject_user, Kreon.LearningObject.Model.LearningObjectUser
  end

  @required ~w(id name url)a

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, ~w(id name type parent_id description url))
    |> validate_required(@required)
  end
end