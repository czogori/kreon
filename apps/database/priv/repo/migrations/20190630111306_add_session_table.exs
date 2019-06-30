defmodule Repo.Migrations.AddSessionTable do
  use Ecto.Migration

  def change do
    create table(:session, primary_key: false) do
      add :id,                 :uuid,   primary_key: true
      add :learning_object_id, references(:learning_object, type: :uuid), null: false
      add :user_id,            references(:user, type: :uuid), null: false
      add :begin, :naive_datetime, null: false
      add :end, :naive_datetime, null: false
    end
  end
end
