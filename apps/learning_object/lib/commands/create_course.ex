defmodule LearningObject.Commands.CreateCourse do
  alias __MODULE__

  defstruct uuid: "",
            name: "",
            items: []

  use ExConstructor
  use Vex.Struct

  validates :name, presence: true, length: [min: 2]

  def assign_uuid(%CreateCourse{} = create_course, uuid) do
    %CreateCourse{create_course | uuid: uuid}
  end
end
