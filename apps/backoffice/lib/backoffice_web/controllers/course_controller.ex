defmodule BackofficeWeb.CourseController do
  use BackofficeWeb, :controller
  alias LearningObject

  def new(conn, _params) do
    render(conn, "new.html", errors: [])
  end

  def create(conn, %{"course" => course}) do
    case LearningObject.create_course(course) do
      {:ok, _} ->
        conn |> redirect(to: Routes.learning_object_path(conn, :index))

      {:error, errors} ->
        render conn, "new.html",
          errors: errors |> Enum.map(fn {_,name,_,msg} -> {name, {msg, []}} end)
    end
  end
end
