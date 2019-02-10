defmodule Kreon.LearningObject.Query.My do
    import Ecto.Query
    alias Kreon.LearningObject.Model.My

    def execute(%{user_id: user_id}) do
        query = from r in My,
          where: r.user_id == ^user_id
        Repo.all(query)
    end
end