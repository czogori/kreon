defmodule LearningObject.Projectors.Registration do
  use Commanded.Projections.Ecto,
    name: "LearningObject.Projectors.Registration",
    consistency: :strong

  alias LearningObject.Events.{UserRegistered}
  alias LearningObject.ReadModels.Registration

  project(%UserRegistered{} = e, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :registration, %Registration{
      id: e.id,
      user_id: e.user_id,
      learning_object_id: e.learning_object_id
    })
  end)
end
