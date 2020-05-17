defmodule Nav do
  use Phoenix.LiveComponent

  def render(assigns) do
    HelloPhoenixLiveViewWeb.AdminLiveView.render("nav.html", assigns)
  end


end
