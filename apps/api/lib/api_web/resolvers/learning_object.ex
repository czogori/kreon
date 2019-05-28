defmodule ApiWeb.Resolvers.LearningObject do
  def all(_args, _info) do
    {:ok, LearningObject.all()}
  end

  def find(%{id: id}, _info) do
    case LearningObject.one(id) do
      nil -> {:error, "Learning object not found"}
      learning_object -> {:ok, learning_object}
    end
  end

  def find(_, _), do: {:error, "Not Authorized"}

  def create(args, _info) do
    LearningObject.create_video(args)
  end
end
