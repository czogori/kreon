defmodule LearningObject.Aggregates.Session do
  defstruct uuid: nil,
            learning_object_id: nil,
            user_id: nil,
            begin: nil,
            stop: nil

  alias __MODULE__
  alias LearningObject.Commands.{BeginSession}
  alias LearningObject.Events.{SessionBegun}

  def begin_session(
        %Session{} = _session,
        %BeginSession{
          uuid: uuid,
          learning_object_id: learning_object_id,
          user_id: user_id,
          begin: begin
        }
      ) do
    %SessionBegun{
      uuid: uuid,
      learning_object_id: learning_object_id,
      user_id: user_id,
      begin: begin
    }
  end

  def apply(
        %Session{} = session,
        %SessionBegun{
          uuid: uuid,
          learning_object_id: learning_object_id,
          user_id: user_id,
          begin: begin
        }
      ) do
    %Session{session | uuid: uuid,
      learning_object_id: learning_object_id,
      user_id: user_id,
      begin: begin
    }
  end
end
