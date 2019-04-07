defmodule Kreon.User.Command.Register do
    alias Kreon.User

    def execute(params) do
        changeset = User.registration_changeset(%User{}, params)
        Repo.insert(changeset)
    end
end