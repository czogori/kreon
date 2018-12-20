defmodule Kreon.LearningObject.Query.GetById do
    alias Kreon.LearningObject.Model.LearningObject
    alias Kreon.LearningObject.Repo

    def execute(id), do: Repo.get(LearningObject, id)
end