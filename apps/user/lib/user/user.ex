defmodule Kreon.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "user" do
    field(:login)
    field(:email)
    field(:role)
    field(:name)
    field(:surname)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)

    timestamps()
  end

  @required ~w(id login email name surname role)a

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:login, min: 2, max: 20)
    |> unique_constraint(:login)
  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> changeset(params)
    |> cast(params, ~w(password)a, [])
    |> validate_required([:password])
    |> validate_length(:password, min: 2, max: 30)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Argon2.hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end
