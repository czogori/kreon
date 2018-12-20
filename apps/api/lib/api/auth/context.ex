defmodule Api.Auth.Context do
    @behaviour Plug
   
    import Plug.Conn
    alias Kreon.User.Query.GetById
   
    def init(opts), do: opts
   
    def call(conn, _) do
     case build_context(conn) do
      {:ok, context} ->
       put_private(conn, :absinthe, %{context: context})
      _ ->
       conn
     end
    end
   
    defp build_context(conn) do
     with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
          {:ok, current_user} <- authorize(token) do
      {:ok, %{current_user: current_user, token: token}}
     end
    end
   


    defp authorize(token) do
        case Api.Auth.Guardian.decode_and_verify(token) do
            {:ok, claims} -> {:ok, GetById.execute(claims["sub"])}
            {:error, msg} -> {:error, msg}
        end
   end
end