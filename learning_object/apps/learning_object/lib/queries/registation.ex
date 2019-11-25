defmodule LearningObject.Queries.Registration do
  import Ecto.Query
  alias LearningObject.ReadModels.My

  def my(user_id) do
    query =
      from(r in My,
        where: r.user_id == ^user_id,
        order_by: [desc: r.updated_at]
      )

    Repo.all(query)
  end
end
