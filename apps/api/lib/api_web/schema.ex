defmodule ApiWeb.Schema do
  use Absinthe.Schema
  import_types ApiWeb.SchemaTypes

  alias ApiWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      arg :offset, :integer, default_value: 0
      arg :limit, :integer, default_value: 5
      resolve &Resolvers.User.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Resolvers.User.find/2
    end

    field :learning_objects, list_of(:learning_object) do
      resolve &Resolvers.LearningObject.all/2
    end

    field :learning_object, type: :learning_object do
      arg :id, non_null(:id)
      resolve &Resolvers.LearningObject.find/2
    end

  #   field :user_learning_objects, list_of(:learning_object_user) do
  #     resolve &Resolvers.LearningObjectUser.all/2
  #   end

  #   field :results, list_of(:result) do
  #     arg :learning_object_id, :integer
  #     arg :user_id, :integer
  #     resolve &Resolvers.Result.all/2
  #   end

  #   field :my, list_of(:my) do
  #     arg :user_id, :integer
  #     resolve &Resolvers.Result.my/2
  #   end
  end

  mutation do
    field :auth, type: :token do
      arg :login, non_null(:string)
      arg :password, non_null(:string)
   
      resolve &Resolvers.User.authenticate/2
    end

    # field :sign_out, type: :accounts_user do
    #   arg(:id, non_null(:id))
    #   resolve &Resolvers.User.logout/2
    #  end

    @desc "Create a user"
    field :create_user, :user do
      arg :login, non_null(:string)
      arg :password, non_null(:string)
      arg :email, non_null(:string)
      arg :name, non_null(:string)
      arg :surname, non_null(:string)

      resolve &Resolvers.User.create/2
    end

    # @desc "Update a user"
    # field :update_user, type: :user do
    #   arg :id, non_null(:integer)
    #   arg :user, :update_user_params
 
    #   resolve &Api.UserResolver.update/2
    # end

    # @desc "Delete a user"
    # field :delete_user, type: :user do
    #   arg :id, non_null(:integer)
    #   resolve &Api.UserResolver.delete/2
    # end

    @desc "Create a video"
    field :create_video, :video do
      arg :name, non_null(:string)
      # arg :description, :string
      arg :url, :string

      resolve &Resolvers.LearningObject.create/2
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

  #   @desc "Register user on learning object"
  #   field :register, type: :learning_object_user do
  #     arg :learning_object_id, non_null(:string)
  #     arg :user_id, non_null(:integer)
  #     resolve &Resolvers.LearningObject.register/2
  #   end

  #   @desc "Deregister user on learning object"
  #   field :deregister, type: :learning_object_user do
  #     arg :learning_object_id, non_null(:string)
  #     arg :user_id, non_null(:integer)
  #     resolve &Resolvers.LearningObject.deregister/2
  #   end
  end

  subscription do
    field :user_added, :user do
      arg :repo_name, non_null(:string)
  
      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments. You can think of it as a way to tell the
      # difference between
      # subscription {
      #   commentAdded(repoName: "absinthe-graphql/absinthe") { content }
      # }
      #
      # and
      #
      # subscription {
      #   commentAdded(repoName: "elixir-lang/elixir") { content }
      # }
      config fn args, _ ->
        {:ok, topic: args.repo_name}
      end
  
      # this tells Absinthe to run any subscriptions with this field every time
      # the :submit_comment mutation happens.
      # It also has a topic function used to find what subscriptions care about
      # this particular comment
      trigger :create_user, topic: fn user ->
        user.login
      end
  
      resolve fn user, _, _ ->
        # this function is often not actually necessary, as the default resolver
        # for subscription functions will just do what we're doing here.
        # The point is, subscription resolvers receive whatever value triggers
        # the subscription, in our case a comment.
        {:ok, user}
      end
  
    end
  end

end