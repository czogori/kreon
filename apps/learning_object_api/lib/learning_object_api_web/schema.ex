defmodule LearningObjectApiWeb.Schema do
  use Absinthe.Schema
  import_types(LearningObjectApiWeb.SchemaTypes)

  alias LearningObjectApiWeb.Resolvers

  query do
    field :learning_objects, list_of(:learning_object) do
      resolve(&Resolvers.LearningObject.all/2)
    end

    field :learning_object, type: :learning_object do
      arg(:id, non_null(:id))
      resolve(&Resolvers.LearningObject.find/2)
    end

    #   field :results, list_of(:result) do
    #     arg :learning_object_id, :integer
    #     arg :user_id, :integer
    #     resolve &Resolvers.Result.all/2
    #   end

    field :my, list_of(:my) do
      arg(:user_id, non_null(:string))
      resolve(&Resolvers.Registration.my/2)
    end
  end

  mutation do
    @desc "Create a video"
    field :create_video, :learning_object do
      arg(:name, non_null(:string))
      # arg :description, :string
      arg(:url, :string)

      resolve(&Resolvers.LearningObject.create/2)
    end

    #   @desc "Delete a learning object"
    #   field :delete_learning_object, type: :learning_object do
    #     arg :id, non_null(:integer)
    #     resolve &Resolvers.LearningObject.delete/2
    #   end

    #   @desc "Commit result"
    #   field :commit, :result do
    #     arg :user_id, non_null(:integer)
    #     arg :learning_object_id, non_null(:integer)
    #     arg :status, :string
    #     arg :score, :integer
    #     arg :time, :integer
    #     arg :progress, :integer

    #     resolve &Resolvers.Result.commit/2
    #   end

    @desc "Register a user on learning object"
    field :register, type: :registration do
      arg(:learning_object_id, non_null(:string))
      arg(:user_id, non_null(:string))
      resolve(&Resolvers.Registration.register/2)
    end

    @desc "Begin a session"
    field :begin_session, type: :string do
      arg(:learning_object_id, non_null(:string))
      arg(:user_id, non_null(:string))
      resolve(&Resolvers.Session.begin_session/2)
    end
  end
end
