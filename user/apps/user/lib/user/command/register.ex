defmodule Kreon.User.Command.Register do
  alias Kreon.User

  def execute(params) do
    changeset = User.registration_changeset(%User{}, params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        user_created(user)
        {:ok, user}
      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def user_created(%User{} = user_created) do
    user = %{
      id: user_created.id,
      login: user_created.login,
      name: user_created.name,
      surname: user_created.surname
    }
    Phoenix.PubSub.broadcast(:message_bus, "user_registered", user)
  end
end
