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

  object :video do
    field(:uuid, :id)
    field(:name, :string)
    field(:url, :string)
  end

  object :learning_object do
    field(:id, :id)
    field(:name, :string)
    field(:type, :string)
    field(:parent_id, :integer)
    field(:url, :string)
    field(:description, :string)
    field :items, list_of(:course_item)
  end

  object :registration do
    field(:id, :string)
    field(:learning_object_id, :string)
    field(:user_id, :string)
  end

  # object :result do
  #   field :learning_object_id, :string
  #   field :user_id, :string
  #   field :status, :string
  #   field :score, :string
  #   field :time, :string
  #   field :progress, :string
  # end

  object :course_item do
    field(:id, :string)
    field(:name, :string)
  end

  object :my do
    field(:id, :string)
    field(:user_id, :string)
    # field :status, :string
    # field :score, :string
    # field :time, :string
    # field :progress, :string
    field(:name, :string)
    field(:description, :string)
  end

  object :session do
    field(:id, :string)
    field(:learning_object_id, :string)
    field(:user_id, :string)
  end
end
