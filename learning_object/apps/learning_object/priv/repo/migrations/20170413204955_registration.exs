defmodule LearningObject.Repo.Migrations.CreateRegistration do
  use Ecto.Migration

  def change do
    create table(:registration, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :learning_object_id, references(:learning_object, type: :uuid)
      add :user_id,            references(:user, type: :uuid)

      timestamps()
    end

    create(unique_index(:registration, [:user_id, :learning_object_id]))
  end
end
