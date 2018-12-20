defmodule Kreon.LearningObject.Query.Results do
    import Ecto.Query
    alias Kreon.LearningObject.Model.Result
    alias Kreon.LearningObject.Repo

    def execute(%{user_id: user_id}) do
        query = from r in Result,
          where: r.user_id == ^user_id
        Repo.all(query)
    end
end