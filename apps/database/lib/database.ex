defmodule Database do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Database.Worker.start_link(arg1, arg2, arg3)
      worker(Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Database.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
