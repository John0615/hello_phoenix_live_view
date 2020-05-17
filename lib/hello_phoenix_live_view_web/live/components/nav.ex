defmodule Nav do
  use Phoenix.LiveComponent

  def render(assigns) do
    HelloPhoenixLiveViewWeb.NavView.render("index.html", assigns)
  end


end
