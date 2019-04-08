defmodule LearningObject.CommandHandlers.CreateVideoHandler do
  @behaviour Commanded.Commands.Handler

  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo

  def handle(%Video{uuid: nil} = aggregate, %CreateVideo{} = create_video) do
    Video.create_video(%Video{}, create_video)
  end
end