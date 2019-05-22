defmodule User.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user, primary_key: false) do
      add :id,            :uuid,   primary_key: true
      add :login,         :text, null: false
      add :email,         :text, null: false
      add :role,          :text, null: false
      add :password_hash, :text
      add :name,          :text, null: false
      add :surname,       :text, null: false

      timestamps()
    end
  end
end
