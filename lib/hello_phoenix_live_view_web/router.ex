defmodule HelloPhoenixLiveViewWeb.Router do
  use HelloPhoenixLiveViewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenixLiveViewWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/test_live", TestLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenixLiveViewWeb do
  #   pipe_through :api
  # end
end
