defmodule LearningObject.Commands.RegisterUser do
  alias Ecto.Changeset
  alias __MODULE__

  defstruct id: nil,
            user_id: nil,
            learning_object_id: nil

  use ExConstructor
  use Vex.Struct

  validates(:user_id, presence: true)
  validates(:learning_object_id, presence: true)

  def assign_uuid(%RegisterUser{} = registration, uuid) do
    %RegisterUser{registration | id: uuid}
  end
end
