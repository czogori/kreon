defmodule LearningObject.Commands.BeginSession do
  alias __MODULE__

  defstruct uuid: nil,
            learning_object_id: nil,
            user_id: nil,
            begin: nil

  use ExConstructor
  use Vex.Struct

  # validates(:name, presence: true, length: [min: 2])

  def assign_uuid(%BeginSession{} = begin_session, uuid) do
    %BeginSession{begin_session | uuid: uuid}
  end

  def assign_begin(%BeginSession{} = begin_session, begin) do
    %BeginSession{begin_session | begin: begin}
  end
end
