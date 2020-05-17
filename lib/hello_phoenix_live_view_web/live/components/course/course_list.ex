defmodule CourseListComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course

  def mount(socket) do
    course_list = Course.list_course_list()
    IO.inspect(course_list, label: "course_list>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:course_list, course_list)
    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(assigns, label: "assigns>>>>> ", pretty: true)
    HelloPhoenixLiveViewWeb.CourseView.render("course_list.html", assigns)
  end


  def handle_event("show_create_course", params, socket) do
    IO.inspect(socket, label: "888888>>>>>>", pretty: true)
    send self(), {:show_create_course_page, params}
    { :noreply, socket }
  end


end
