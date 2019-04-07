defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.Video
  alias LearningObject.Commands.CreateVideo

  dispatch([CreateVideo], to: Video, identity: :uuid)
end