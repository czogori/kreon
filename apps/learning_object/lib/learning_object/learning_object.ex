defmodule Kreon.LearningObject do

    @moduledoc """
    Bounded context for Learning Object
    """
    
    alias Kreon.LearningObject.Command.{CreateLearningObject, DeleteLearningObject, Register, Deregister}
    alias Kreon.LearningObject.Query.{GetById, ListLearningObjects}
    
    def create(params), do: CreateLearningObject.execute(params)    
    def delete(params), do: DeleteLearningObject.execute(params)

    def get_by_id(id), do: GetById.execute(id)
    def all(), do: ListLearningObjects.execute()

    def register(params), do: Register.execute(params)
    def deregister(params), do: Deregister.execute(params)
end