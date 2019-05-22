defmodule LearningObject.Aggregates.Registration do
  defstruct user_id: nil,
            learning_object_id: nil

  alias __MODULE__
  alias LearningObject.Commands.RegisterUser
  alias LearningObject.Events.UserRegistered

  def register_user(
    %Registration{} = _registration,
    %RegisterUser{
      user_id: user_id,
      learning_object_id: learning_object_id,
    }
  ) do
    %UserRegistered{
      user_id: user_id,
      learning_object_id: learning_object_id,
    }
  end

  def apply(
    %Registration{} = registration,
    %UserRegistered{
      user_id: user_id,
      learning_object_id: learning_object_id,
    }
  ) do
    %Registration{registration | user_id: user_id, learning_object_id: learning_object_id}
  end
end
