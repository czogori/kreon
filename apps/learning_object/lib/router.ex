defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo
  alias LearningObject.CommandHandlers.CreateVideoHandler

  dispatch([CreateVideo], to: CreateVideoHandler, aggregate: Video, identity: :uuid)
end