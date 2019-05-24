defmodule LearningObject.Queries.LearningObject do
  import Ecto.Query
  alias LearningObject.ReadModels.LearningObject

  def all do
    query =
      from(lo in LearningObject,
        where: is_nil(lo.parent_id),
        order_by: [desc: lo.updated_at]
      )

    Repo.all(query)
  end

  def get(id) do
    lo = Repo.get(LearningObject, id)
    if lo.type == "course" do
      id = lo.id
      query =
        from(lo in LearningObject,
          where: lo.parent_id == ^id,
          order_by: [desc: lo.updated_at]
        )

      Map.put(lo, :items, Repo.all(query))
    else
      lo
    end
  end
end
