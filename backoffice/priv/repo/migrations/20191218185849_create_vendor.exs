defmodule Backoffice.Repo.Migrations.CreateVendor do
  use Ecto.Migration

  def change do
    create table(:vendor) do
      add :name, :string
      add :code, :string

      timestamps()
    end

  end
end
