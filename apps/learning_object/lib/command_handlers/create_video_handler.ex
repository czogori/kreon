defmodule LearningObject.CommandHandlers.CreateVideoHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo

  def handle(%Video{uuid: nil} = _aggregate, %CreateVideo{} = create_video) do
    case Vex.valid?(create_video) do
      true -> Video.create_video(%Video{}, create_video)
      false -> {:error, Vex.errors(create_video)}
    end
  end
end
