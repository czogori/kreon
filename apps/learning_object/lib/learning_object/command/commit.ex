defmodule Kreon.LearningObject.Command.Commit do
    alias Kreon.LearningObject.Model.Result
    import Ecto.Query, only: [from: 2]

    def execute(params) do
        {id, params} = Map.split(params, [:learning_object_id, :user_id])
        # result = Repo.get_by(Result, %{learning_object_id: 1, user_id: 2})
        query = from r in Result, 
            where: r.learning_object_id == ^id.learning_object_id and r.user_id == ^id.user_id
        result = Repo.one(query)
        changeset = Result.changeset(result, params)
        case Repo.update(changeset) do
            {:ok, struct}       -> struct
            {:error, changeset} -> changeset
        end
    end
end