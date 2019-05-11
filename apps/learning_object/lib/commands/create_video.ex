defmodule LearningObject.Commands.CreateVideo do
  alias Ecto.Changeset

  defstruct uuid: "",
            name: "",
            url: ""

  @types %{
    uuid: :string,
    name: :string,
    url: :string
  }

  def validate(command, params \\ %{}) do
    fields = Map.keys(@types)

    changeset =
      {command, @types}
      |> Ecto.Changeset.cast(params, fields)
      |> Ecto.Changeset.validate_required(fields)
  end
end
