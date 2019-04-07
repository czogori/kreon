defmodule LearningObject.Projectors.VideoCreated do
  use Commanded.Projections.Ecto,
    name: "LearningObject.Projectors.VideoCreated"

  alias LearningObject.Events.VideoCreated
  alias LearningObject.Projections.LearningObject, as: Lo

  project(%VideoCreated{} = evt, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :video_created, %Lo{
      id: evt.uuid,
      name: evt.name,
      url: evt.url,
      type: "video"
    })
  end)
end