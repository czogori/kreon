defmodule LearningObject do

    alias LearningObject.Commands.CreateVideo
    alias LearningObject.ReadModels.Query
    alias LearningObject.Router

    @moduledoc """
    Bounded context for Learning Object
    """
    def create_video(%{name: name, url: url, uuid: uuid} = params) do
      struct(CreateVideo, params)
      |> Router.dispatch(consistency: :strong)

      uuid
    end

    def create_video(%{name: name, url: url} = params) do
      Map.put(params, :uuid, Ecto.UUID.generate())
      |> create_video()
    end

    # Router.dispatch(create_author, consistency: :strong)
    # with :ok <- Router.dispatch(create_author, consistency: :strong) do
    #     get(Author, uuid)
    # else
    #     reply -> reply
    # end
    #   end

    # alias Kreon.LearningObject.Command.{CreateLearningObject, DeleteLearningObject, Register, Deregister}
    # alias Kreon.LearningObject.Query.{GetById, ListLearningObjects}
    
    # def create(params), do: CreateLearningObject.execute(params)    
    # def delete(params), do: DeleteLearningObject.execute(params)

    defdelegate all(), to: Query
    defdelegate get(id), to: Query

    # def register(params), do: Register.execute(params)
    # def deregister(params), do: Deregister.execute(params)
end