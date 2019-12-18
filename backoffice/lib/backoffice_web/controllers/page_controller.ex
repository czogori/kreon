defmodule BackofficeWeb.PageController do
  use BackofficeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
