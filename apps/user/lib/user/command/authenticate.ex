defmodule Kreon.User.Command.Authenticate do
    alias Kreon.User.Repo
    alias Kreon.User
    import Ecto.Query, warn: false

    def execute(login, password) do
        query = from u in User, where: u.login == ^login
        Repo.one(query)
        |> check_password(password)
    end

    defp check_password(nil, _), do: {:error, "Incorrect username or password"}
    defp check_password(user, plain_text_password) do
        case Comeonin.Argon2.checkpw(plain_text_password, user.password_hash) do
            true -> {:ok, user}
            false -> {:error, "Incorrect username or password"}
        end
    end
end