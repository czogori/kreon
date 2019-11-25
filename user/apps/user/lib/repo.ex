defmodule Repo do
  use Ecto.Repo,
    otp_app: :user,
    adapter: Ecto.Adapters.Postgres

  def sandbox do
    Ecto.Adapters.SQL.Sandbox
  end
end
