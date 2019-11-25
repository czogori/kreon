defmodule ApiGateway.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @port 4000

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: ApiGateway.Router, options: [port: @port]}
    ]
    opts = [strategy: :one_for_one, name: ApiGateway.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
