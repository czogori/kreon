defmodule LearningObject.CommandHandlers.CreateVideoHandler do
  @behaviour Commanded.Commands.Handler
  alias Ecto.Changeset

  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo

  @types %{
    uuid: :string,
    name: :string,
    url: :string
  }

  def handle(%Video{uuid: nil} = aggregate, %CreateVideo{} = create_video) do
    changeset = validate(create_video, Map.from_struct(create_video)) 
    case changeset.valid? do
      true  -> Video.create_video(%Video{}, create_video)
      false -> {:error, changeset.errors}
    end
  end

  defp  validate(command, params \\ %{}) do
    fields = Map.keys(@types)
    changeset =
      {command, @types}
      |> Ecto.Changeset.cast(params, fields)
      |> Ecto.Changeset.validate_required(fields)
  end
end