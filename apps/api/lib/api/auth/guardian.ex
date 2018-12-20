defmodule Api.Auth.Guardian do
    use Guardian, otp_app: :api

    def subject_for_token(user, _claims) do
        IO.inspect user
      {:ok, to_string(user.id)}
    end
    
    def resource_from_claims(claims) do
        IO.inspect(claims)
      user = claims["sub"]
      |> Kreon.User.Query.GetById.execute()
      {:ok, user}
      # If something goes wrong here return {:error, reason}
    end
  end