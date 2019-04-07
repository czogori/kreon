defmodule LearningObject.Events.VideoCreated do
  @derive [Jason.Encoder]

  defstruct [
    :uuid,
    :name,
    :url
  ]
end