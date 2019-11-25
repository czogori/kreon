defmodule Kreon.User.Query.GetById do
  alias Kreon.User

  def execute(id), do: Repo.get(User, id)
end
