defmodule LearningObject.CommandHandlers.BeginSessionHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Session
  alias LearningObject.Commands.BeginSession

  def handle(%Session{uuid: nil} = _aggregate, %BeginSession{} = begin_session) do
    Session.begin_session(%Session{}, begin_session)
    # case Vex.valid?(create_course) do
    #   true -> Course.create_course(%Course{}, create_course)
    #   false -> {:error, Vex.errors(create_course)}
    # end
  end
end
