defmodule DashBoard do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.DashBoardView.render("index.html", assigns)
  end


end
