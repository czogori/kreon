defmodule Kreon.User.Query.All do
  alias Kreon.User
  import Ecto.Query

  def execute(%{limit: limit, offset: offset}),
    do: Repo.all(User |> limit(^limit) |> offset(^offset))
end
