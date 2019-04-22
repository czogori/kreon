defmodule BackofficeWeb.LearningObjectController do
  use BackofficeWeb, :controller
  alias LearningObject.Commands.CreateVideo
  
  def index(conn, _params) do
    render conn, "index.html", items: LearningObject.all()
  end

  def new(conn, _params) do
    changeset = CreateVideo.validate(%CreateVideo{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"name" => name, "url" => url} = params) do
    case LearningObject.create_video(%{name: name, url: url}) do
      {:ok, _} ->
        conn |> redirect(to: Routes.learning_object_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end