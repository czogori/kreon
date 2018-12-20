defmodule Kreon.User.Query.GetById do
    alias Kreon.User
    alias Kreon.User.Repo

    def execute(id), do: Repo.get(User, id)
end