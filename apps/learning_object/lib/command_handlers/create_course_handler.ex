defmodule LearningObject.CommandHandlers.CreateCourseHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Course
  alias LearningObject.Commands.CreateCourse

  def handle(%Course{uuid: nil} = _aggregate, %CreateCourse{} = create_course) do
    case Vex.valid?(create_course) do
      true -> Course.create_course(%Course{}, create_course)
      false -> {:error, Vex.errors(create_course)}
    end
  end
end
