defmodule ApiWeb.Resolvers.User do
  alias Api.Auth.Guardian
  alias Kreon.User
  alias Kreon.User.Command.{Authenticate, Register}
  alias Kreon.User.Query.{All, GetById}

  require Logger

  def all(args, %{context: %{current_user: _current_user}}),
    do: {:ok, All.execute(args)}

  def all(_, _), do: {:error, "Not Authorized"}

  def find(%{id: id}, %{context: %{current_user: _current_user}}) do
    case GetById.execute(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def find(_, _), do: {:error, "Not Authorized"}

  def create(args, _info) do
    Register.execute(args)
  end

  def update(%{id: id, user: user_params}, _info) do
    case GetById.execute(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> user |> User.changeset(user_params) |> Repo.update()
    end
  end

  def delete(%{id: id}, _info) do
    case GetById.execute(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, Repo.delete(user)}
    end
  end

  def authenticate(%{login: login, password: password}, _info) do
    case Authenticate.execute(login, password) do
      {:ok, user} ->
        IO.inspect(user)
        create_token(user)
      {:error, message} -> {:error, message}
    end
  end

  defp create_token(user) do
    case Guardian.encode_and_sign(user) do
      nil -> {:error, "An Error occured creating the token"}
      {:ok, token, full_claims} -> {:ok, %{token: token, user: user}}
    end
  end
end
