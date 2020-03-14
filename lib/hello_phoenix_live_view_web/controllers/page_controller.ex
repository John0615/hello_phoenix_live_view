defmodule HelloPhoenixLiveViewWeb.PageController do
  use HelloPhoenixLiveViewWeb, :controller
  alias HelloPhoenixLiveView.Accounts.User

  def index(conn, _params) do
    # render(conn, "index.html")
    changeset = User.changeset(%User{}, %{phone: "17722443741", name: "John", email: "1655913438@qq.com", password: "123456"})
    render conn, "index.html", changeset: changeset
  end
end
