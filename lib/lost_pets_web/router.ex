defmodule LostPetsWeb.Router do
  use LostPetsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LostPetsWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/pets", PetController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LostPetsWeb do
  #   pipe_through :api
  # end
end
