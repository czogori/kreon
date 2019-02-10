defmodule Kreon.LearningObject.Command.CreateLearningObject do
    alias Kreon.LearningObject.Model.LearningObject

    def execute(params) do
        changeset = LearningObject.changeset(%LearningObject{}, params)
        Repo.insert(changeset)
        # case Repo.insert(changeset) do
        #     {:ok, struct}       -> struct
        #     {:error, changeset} -> changeset
        # end
    end
end