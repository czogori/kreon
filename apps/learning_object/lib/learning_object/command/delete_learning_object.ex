defmodule Kreon.LearningObject.Command.DeleteLearningObject do
    alias Kreon.LearningObject.Model.LearningObject

    def execute(%{id: id}) do
        learning_object = Repo.get!(LearningObject, id)
        Repo.delete(learning_object)
    end
end