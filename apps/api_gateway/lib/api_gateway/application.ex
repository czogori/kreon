defmodule ApiGateway.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias ApiGateway.ProxyPlug

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # port = (System.get_env("PORT") || "3333") |> String.to_integer
    port = 4444
    # cowboy = Plug.Adapters.Cowboy.child_spec(:http, ApiGateway.ProxyPlug, [port: port])

    children = [
      # cowboy
      {Plug.Cowboy, scheme: :http, plug: ProxyPlug, options: [port: 4040]}
    ]

    opts = [strategy: :one_for_one, name: ApiGeteway.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
