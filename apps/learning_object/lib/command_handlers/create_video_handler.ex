defmodule LearningObject.CommandHandlers.CreateVideoHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo

  def handle(%Video{uuid: nil} = _aggregate, %CreateVideo{} = create_video) do
    changeset = CreateVideo.validate(create_video, Map.from_struct(create_video))

    case changeset.valid? do
      true -> Video.create_video(%Video{}, create_video)
      false -> {:error, changeset}
    end
  end
end
