defmodule Kreon.User do
  use Kreon.Schema
  import Ecto.Changeset

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

  defp put_pass_hash(%Ecto.Changeset{valid?: true,
      changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
