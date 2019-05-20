defmodule LearningObject.Repo.Migrations.CreateRegistration do
  use Ecto.Migration

  def change do
    create table(:registration, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :learning_object_id, references(:learning_object, type: :uuid)
      add :user_id,            references(:user, type: :uuid)

      timestamps()
    end
  end
end
