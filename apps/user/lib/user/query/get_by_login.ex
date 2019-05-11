defmodule Kreon.User.Query.GetByLogin do
  alias Kreon.User

  def execute(login), do: Repo.get!(User, login)
end
