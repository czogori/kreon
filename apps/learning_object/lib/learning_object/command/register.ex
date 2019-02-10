defmodule Kreon.LearningObject.Command.Register do
    alias Kreon.LearningObject.Model.LearningObjectUser

    def execute(params) do
        changeset = LearningObjectUser.changeset(%LearningObjectUser{}, params)
        Repo.insert(changeset)
    end
end