defmodule User.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user, primary_key: false) do
      add :id,            :uuid,   primary_key: true
      add :login,         :string, null: false
      add :email,         :string, null: false
      add :role,          :string, null: false
      add :password_hash, :string
      add :name,          :string, null: false
      add :surname,       :string, null: false

      timestamps()
    end
  end
end
