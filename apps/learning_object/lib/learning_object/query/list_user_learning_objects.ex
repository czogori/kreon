defmodule Kreon.LearningObject.Query.ListUserLearningObjecs do
    import Ecto.Query
    alias Kreon.LearningObject.Model.LearningObject
    alias Kreon.LearningObject.Model.LearningObjectUser
    alias Kreon.LearningObject.Repo

    def execute(user_id) do
        query = from lou in LearningObjectUser,
                join: lo in LearningObject, where: lou.learning_object_id == lo.id,
                where: lou.user_id == ^user_id,
                select: %{learning_object_id: lo.id, user_id: lou.user_id, name: lo.name}
        Repo.all(query)
    end
end