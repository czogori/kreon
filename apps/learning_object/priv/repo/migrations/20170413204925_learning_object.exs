defmodule LearningObject.Repo.Migrations.CreateLearningObject do
  use Ecto.Migration

  def change do
    create table(:learning_object, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :type, :string, null: false
      add :parent_id, :uuid
      add :url, :string
      add :description, :string
      add :parameters, :map

      timestamps()
    end
  end
end
