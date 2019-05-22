defmodule LearningObject.Events.UserRegistered do
  @derive [Jason.Encoder]

  defstruct [
    :user_id,
    :learning_object_id
  ]
end
