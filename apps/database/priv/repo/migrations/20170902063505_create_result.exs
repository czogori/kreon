defmodule LearningObject.Repo.Migrations.CreateResult do
  use Ecto.Migration

  def change do
    create table(:result) do
      add :learning_object_id, references(:learning_object, type: :uuid), null: false
      add :user_id,            references(:user, type: :uuid), null: false
      add :status,             :string, null: false
      add :score,              :integer, null: false
      add :time,               :integer, null: false
      add :progress,           :integer, null: false

      timestamps()
    end
  end
end
