defmodule Course do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course

  def mount(socket) do
    socket =
      socket
      |> assign(:show_page, "course_list")
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.CourseView.render("index.html", assigns)
  end




end
