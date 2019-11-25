defmodule LearningObject.Events.SessionEnded do
  @derive [Jason.Encoder]

  defstruct [
    :uuid,
    :learning_object_id,
    :user_id,
    :begin,
    :end
  ]
end
