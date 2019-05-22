defmodule LearningObject.Commands.RegisterUser do
  alias Ecto.Changeset

  defstruct user_id: nil,
            learning_object_id: nil

  use ExConstructor
  use Vex.Struct

  validates :user_id, presence: true
  validates :learning_object_id, presence: true
end
