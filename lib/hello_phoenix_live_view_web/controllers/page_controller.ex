defmodule HelloPhoenixLiveViewWeb.PageController do
  use HelloPhoenixLiveViewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
    # changeset = User.changeset(%User{})
    # render conn, "index.html", changeset: changeset
  end
end
