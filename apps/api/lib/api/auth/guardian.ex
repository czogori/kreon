defmodule Api.Auth.Guardian do
  use Guardian, otp_app: :api
  alias Kreon.User.Query.GetById

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user =
      claims["sub"]
      |> GetById.execute()

    {:ok, user}
    # If something goes wrong here return {:error, reason}
  end
end
