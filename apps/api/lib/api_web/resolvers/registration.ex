defmodule ApiWeb.Resolvers.Registration do
  def my(%{user_id: user_id}, _info) do
    IO.inspect(user_id)
    {:ok, LearningObject.my(user_id)}
    # {:ok, LearningObject.user(user_id)}
  end

  def register_user(%{user_id: u, learning_object_id: lo}, _info) do
    LearningObject.register(u, lo)
  end
end
