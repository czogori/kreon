defmodule LearningObjectSync.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias LearningObjectSync.UserSubscriber
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      %{
        id: Phoenix.PubSub.Redis,
        start: {Phoenix.PubSub.Redis, :start_link, [:message_bus, [
          pool_size: 1,
          node_name: "user",
        ]]}
      },
      Repo,
      UserSubscriber
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LearningObjectSync.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
