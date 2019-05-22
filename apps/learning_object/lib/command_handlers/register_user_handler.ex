defmodule LearningObject.CommandHandlers.RegisterUserHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Registration
  alias LearningObject.Commands.RegisterUser

  def handle(
    %Registration{} = _aggregate,
    %RegisterUser{} = register_user) do

    case Vex.valid?(register_user) do
      true -> Registration.register_user(%Registration{}, register_user)
      false -> {:error, Vex.errors(register_user)}
    end
  end
end
