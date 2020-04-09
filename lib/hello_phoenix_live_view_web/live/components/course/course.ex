defmodule CourseComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course

  def mount(socket) do
    socket =
      socket
      |> assign(:show_page, "course_list")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <%=if @show_page=="add_course" do %>
      <%= live_component @socket, AddCourseComponent %>
      <%=end %>
      <%=if @show_page=="course_list" do %>
      <%= live_component @socket, CourseListComponent %>
      <%=end %>
    """
  end


  def handle_event("add_course", params, socket) do
    IO.inspect(params, label: "888888>>>>>>", pretty: true)
    { :noreply, assign(socket, show_page: "add_course") }
  end


end
