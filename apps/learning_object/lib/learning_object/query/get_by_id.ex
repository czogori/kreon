defmodule Kreon.LearningObject.Query.GetById do
    alias Kreon.LearningObject.Model.LearningObject

    def execute(id), do: Repo.get(LearningObject, id)
end