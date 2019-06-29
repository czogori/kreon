defmodule LearningObject.Aggregates.Session do
  defstruct uuid: nil,
            learning_object_id: nil,
            user_id: nil,
            begin: nil,
            end: nil

  alias __MODULE__
  alias LearningObject.Commands.{BeginSession, EndSession}
  alias LearningObject.Events.{SessionBegun, SessionEnded}

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

  def end_session(
    %Session{} = _session,
    %EndSession{
      uuid: uuid,
      learning_object_id: learning_object_id,
      user_id: user_id,
      end: ends
    }
    ) do
    %SessionEnded{
      uuid: uuid,
      learning_object_id: learning_object_id,
      user_id: user_id,
      end: ends
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

  def apply(
        %Session{} = session,
        %SessionEnded{
          uuid: uuid,
          learning_object_id: learning_object_id,
          user_id: user_id,
          end: ends
        }
      ) do
    %Session{session | end: ends}
  end
end
