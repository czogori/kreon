defmodule Kreon.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @primary_key {:id, :binary_id, autogenerate: true}
      @timestamps_opts [type: :utc_datetime]
    end
  end
end
