defmodule ApiGateway.ProxyPlug do
  require Logger
  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn
    |> Plug.Conn.get_req_header("x-kreon-service")
    |> resp(conn)
  end

  defp resp(["lo"], conn), do: LearningObjectApiWeb.Endpoint.call(conn, [])
  defp resp(["user"], conn), do: ApiWeb.Endpoint.call(conn, [])
  defp resp([], conn), do: ApiWeb.Endpoint.call(conn, [])
  defp resp(_, conn) do
    conn
    |> Plug.Conn.resp(404, "Not found")
    |> Plug.Conn.send_resp()
  end
end
