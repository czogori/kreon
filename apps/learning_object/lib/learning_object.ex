defmodule LearningObject do

    alias LearningObject.Commands.CreateVideo
    alias LearningObject.ReadModels.Query
    alias LearningObject.Router

    @moduledoc """
    Bounded context for Learning Object
    """
    def create_video(%{name: name, url: url, uuid: uuid} = params) do
      res = struct(CreateVideo, params)
      |> Router.dispatch(consistency: :strong)
      with :ok <- res do
        {:ok, get(uuid)}
      else
        reply -> reply
      end
    end

    def create_video(%{name: name, url: url} = params) do
      Map.put(params, :uuid, Ecto.UUID.generate())
      |> create_video()
    end

    defdelegate all(), to: Query
    defdelegate get(id), to: Query
end