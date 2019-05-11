defmodule LearningObject.Repo.Migrations.CreateLearningObjectUser do
  use Ecto.Migration

  def change do
    create table(:learning_object_user, primary_key: false) do
      add :learning_object_id, references(:learning_object, type: :uuid), primary_key: true
      add :user_id,            references(:user, type: :uuid), primary_key: true

      timestamps()
    end
  end
end
