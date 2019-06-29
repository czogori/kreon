defmodule LearningObject.Commands.EndSession do
  alias __MODULE__

  defstruct uuid: nil,
            learning_object_id: nil,
            user_id: nil,
            end: nil

  use ExConstructor
  use Vex.Struct

  # validates(:name, presence: true, length: [min: 2])

  def assign_uuid(%EndSession{} = end_session, uuid) do
    %EndSession{end_session | uuid: uuid}
  end

  def assign_end(%EndSession{} = end_session, ends) do
    %EndSession{end_session | end: ends}
  end
end
