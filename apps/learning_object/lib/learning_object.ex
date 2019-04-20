defmodule LearningObject do

    alias LearningObject.Commands.CreateVideo
    alias LearningObject.Queries.LearningObject, as: Q
    alias LearningObject.Router

    @moduledoc """
    Bounded context for Learning Object
    """
    
    def create_video(%{uuid: uuid} = params) do
      res = struct(CreateVideo, params)
      |> Router.dispatch(consistency: :strong)
      
      with :ok <- res do
        {:ok, get(uuid)}
      else
        reply -> reply
      end
    end

    def create_video(%{} = params) do
      Map.put(params, :uuid, Ecto.UUID.generate())
      |> create_video()
    end

    defdelegate all(), to: Q
    defdelegate get(id), to: Q
end