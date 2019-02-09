
defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Api.Auth.Context
    # plug Api.Auth.Pipeline
    # plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack
  end

  if Mix.env == :dev do
    scope "/graphiql" do
      forward "/", Absinthe.Plug.GraphiQL,
        schema: ApiWeb.Schema,
        socket: ApiWeb.UserSocket
    end
  end

  scope "/api" do
    pipe_through :api
    forward "/", Absinthe.Plug,
    schema: ApiWeb.Schema
  end

end