defmodule LearningObject do
  alias LearningObject.Commands.CreateVideo
  alias LearningObject.Queries.LearningObject, as: Q
  alias LearningObject.Router

  @moduledoc """
  Bounded context for Learning Object
  """
  def create_video(params) do
    uuid = Ecto.UUID.generate()

    res =
      CreateVideo
      |> struct(Map.put(params, :uuid, uuid))
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
      {:ok, get(uuid)}
    else
      reply -> reply
    end
  end

  defdelegate all(), to: Q
  defdelegate get(id), to: Q
end
