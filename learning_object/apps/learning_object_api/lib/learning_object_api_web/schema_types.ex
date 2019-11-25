defmodule LearningObjectApiWeb.SchemaTypes do
  use Absinthe.Schema.Notation

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
