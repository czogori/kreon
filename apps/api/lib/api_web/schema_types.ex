defmodule ApiWeb.SchemaTypes do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :id)
    field(:login, :string)
    field(:password, :string)
    field(:email, :string)
    field(:role, :string)
    field(:name, :string)
    field(:surname, :string)
  end

  @desc "A JWT Token"
  object :token do
    field(:token, :string)

    field :user, :user do
      resolve(fn %{user: user}, _, _ ->
        # IO.inspect user, label: "first"
        # IO.inspect args, label: "args"
        # IO.inspect current_user, label: "cu"
        {:ok, user}
      end)
    end
  end
end
