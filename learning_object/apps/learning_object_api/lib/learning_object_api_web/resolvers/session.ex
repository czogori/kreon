defmodule LearningObjectApiWeb.Resolvers.Session do

  def begin_session(%{user_id: user_id, learning_object_id: learning_object_id}, _info) do
    uuid = LearningObject.begin_session(user_id, learning_object_id)
    {:ok, uuid}
  end
end
