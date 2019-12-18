defmodule Backoffice.Vendors.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendor" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
