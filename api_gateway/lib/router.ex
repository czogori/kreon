defmodule ApiGateway.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/graphiql",
    to: ReverseProxyPlug,
    routes: %{
      "default" => "http://localhost:4001/graphiql",
      "lo" => "http://localhost:4002/graphiql"
    }

  get "/" do
    send_resp(conn, 200, "Kreon")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
