defmodule LearningObject.Aggregates.Registration do
  defstruct id: nil,
            user_id: nil,
            learning_object_id: nil

  alias __MODULE__
  alias LearningObject.Commands.RegisterUser
  alias LearningObject.Events.UserRegistered

  def register_user(
        %Registration{} = _registration,
        %RegisterUser{
          id: id,
          user_id: user_id,
          learning_object_id: learning_object_id
        }
      ) do
    %UserRegistered{
      id: id,
      user_id: user_id,
      learning_object_id: learning_object_id
    }
  end

  def apply(
        %Registration{} = registration,
        %UserRegistered{
          id: id,
          user_id: user_id,
          learning_object_id: learning_object_id
        }
      ) do
    %Registration{registration | id: id, user_id: user_id, learning_object_id: learning_object_id}
  end
end
