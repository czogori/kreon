defmodule LearningObject.Projectors.Session do
  use Commanded.Projections.Ecto,
    name: "LearningObject.Projectors.Session",
    consistency: :strong

  alias LearningObject.Events.{SessionEnded}
  alias LearningObject.ReadModels.Session

  project(%SessionEnded{} = session_ended, _metadata, fn multi ->
    IO.inspect session_ended
    Ecto.Multi.insert(multi, :session, %Session{
      id: session_ended.uuid,
      user_id: session_ended.user_id,
      learning_object_id: session_ended.learning_object_id,
      begin: NaiveDateTime.from_iso8601!(session_ended.begin) |> NaiveDateTime.truncate(:second),
      end: NaiveDateTime.from_iso8601!(session_ended.end) |> NaiveDateTime.truncate(:second)
    })
  end)
end
