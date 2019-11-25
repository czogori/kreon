defmodule ApiGateway.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/graphiql", to: BarPlug

  get "/" do
    send_resp(conn, 200, "foo")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
