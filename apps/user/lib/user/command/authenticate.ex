defmodule Kreon.User.Command.Authenticate do
  alias Kreon.User
  import Ecto.Query, warn: false

  def execute(login, password) do
    query = from(u in User, where: u.login == ^login)

    query
    |> Repo.one()
    |> Argon2.check_pass(password)
  end
end

