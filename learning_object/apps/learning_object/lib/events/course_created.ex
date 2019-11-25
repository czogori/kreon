defmodule LearningObject.Events.CourseCreated do
  @derive [Jason.Encoder]

  defstruct [
    :uuid,
    :name,
    :items
  ]
end
