defmodule LearningObject.ReadModels.Query do
  import Ecto.Query
  alias LearningObject.ReadModels.LearningObject

  def all() do
    query = from lo in LearningObject,
      where: is_nil(lo.parent_id)

    Repo.all(query)
  end

  def get(id), do: Repo.get(LearningObject, id)
end