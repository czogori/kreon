defmodule Api.Auth do
  import Ecto.Query, warn: false

  def authenticate_user(login, plain_text_password) do
    query = from(u in Kreon.User, where: u.login == ^login)

    query
    |> Repo.one()
    #    |> check_password(plain_text_password)
    |> Argon2.check_pass(plain_text_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, plain_text_password) do
    case Comeonin.Argon2.checkpw(plain_text_password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end
end
