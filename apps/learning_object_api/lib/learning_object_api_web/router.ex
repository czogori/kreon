defmodule LearningObjectApiWeb.Router do
  use LearningObjectApiWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:browser)
  end

  if Mix.env() == :dev do
    scope "/graphiql" do
      forward("/", Absinthe.Plug.GraphiQL,
        schema: LearningObjectApiWeb.Schema,
        socket: LearnigObjectApiWeb.UserSocket
      )
    end
  end

  scope "/api" do
    pipe_through(:api)
    forward("/", Absinthe.Plug, schema: LearningObjectApiWeb.Schema)
  end
end
