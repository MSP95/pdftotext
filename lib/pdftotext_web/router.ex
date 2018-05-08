defmodule PdftotextWeb.Router do
  use PdftotextWeb, :router
  @moduledoc false

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

  scope "/", PdftotextWeb do
    pipe_through :browser # Use the default browser stack
    post "/", PageController, :handlesubmit
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PdftotextWeb do
  #   pipe_through :api
  # end
end
