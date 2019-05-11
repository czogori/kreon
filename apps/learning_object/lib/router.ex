defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.Video
  alias LearningObject.CommandHandlers.CreateVideoHandler
  alias LearningObject.Commands.CreateVideo

  dispatch([CreateVideo], to: CreateVideoHandler, aggregate: Video, identity: :uuid)
end
