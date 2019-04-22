defmodule BackofficeWeb.PageController do
  use BackofficeWeb, :controller
  
  def index(conn, _params) do
    IO.inspect LearningObject.all()
    render(conn, "index.html")
  end
end
