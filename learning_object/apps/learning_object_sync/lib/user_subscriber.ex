defmodule LearningObjectSync.UserSubscriber do
  use GenServer

  alias LearningObjectSync.User
  require Logger

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    Phoenix.PubSub.subscribe(:message_bus, "user_registered")
    {:ok, %{}}
  end

  def handle_info(incom, state) do
    user = struct(User, incom)
    Repo.insert(user)
    Logger.info("User #{user.id} added")

    {:noreply, state}
  end
end
