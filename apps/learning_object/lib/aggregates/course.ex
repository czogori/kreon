defmodule LearningObject.Aggregates.Course do
  defstruct uuid: nil,
            name: nil,
            items: []

  alias __MODULE__
  alias LearningObject.Commands.CreateCourse
  alias LearningObject.Events.CourseCreated

  def create_course(
        %Course{} = _video,
        %CreateCourse{
          uuid: uuid,
          name: name,
          items: items
        }
      ) do
    %CourseCreated{
      uuid: uuid,
      name: name,
      items: items
    }
  end

  def apply(
        %Course{} = course,
        %CourseCreated{
          uuid: uuid,
          name: name,
          items: items
        }
      ) do
    %Course{course | uuid: uuid, name: name, items: items}
  end
end
