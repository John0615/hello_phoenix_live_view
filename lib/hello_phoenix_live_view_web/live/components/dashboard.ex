defmodule DashBoard do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.AdminLiveView.render("dash_board.html", assigns)
  end


end
