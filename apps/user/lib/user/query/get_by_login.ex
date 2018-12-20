defmodule Kreon.User.Query.GetByLogin do
    alias Kreon.User
    alias Kreon.User.Repo

    def execute(login), do: Repo.get!(User, login)
end