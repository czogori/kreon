defmodule LearningObject.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_arg) do
    children = [
      worker(LearningObject.Projectors.LearningObject, [], id: :learning_object),
      worker(LearningObject.Projectors.Registration, [], id: :registration),
      worker(LearningObject.Projectors.Session, [], id: :session)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
