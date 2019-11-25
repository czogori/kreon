defmodule LearningObject.Events.SessionBegun do
  @derive [Jason.Encoder]

  defstruct [
    :uuid,
    :learning_object_id,
    :user_id,
    :begin
  ]
end
