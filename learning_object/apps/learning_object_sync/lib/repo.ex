defmodule Repo do
  use Ecto.Repo,
    otp_app: :learning_object_sync,
    adapter: Ecto.Adapters.Postgres
end
