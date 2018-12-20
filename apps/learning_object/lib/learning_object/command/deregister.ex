defmodule Kreon.LearningObject.Command.Deregister do
    alias Kreon.LearningObject.Repo
    alias Kreon.LearningObject.Model.LearningObjectUser
    import Ecto.Query

    def execute(%{learning_object_id: learning_object_id, user_id: user_id}) do
        query = from lou in LearningObjectUser,
            where: lou.learning_object_id == ^learning_object_id and lou.user_id == ^user_id
        lou = Repo.one(query)
        Repo.delete(lou)
    end
end