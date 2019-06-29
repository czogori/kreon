defmodule LearningObject.CommandHandlers.SessionHandler do
  @behaviour Commanded.Commands.Handler
  alias LearningObject.Aggregates.Session
  alias LearningObject.Commands.{BeginSession, EndSession}

  def handle(%Session{uuid: nil} = _aggregate, %BeginSession{} = begin_session) do
    Session.begin_session(%Session{}, begin_session)
  end

  def handle(%Session{uuid: nil} = _aggregate, %EndSession{} = end_session) do
    Session.end_session(%Session{}, end_session)
  end
end
