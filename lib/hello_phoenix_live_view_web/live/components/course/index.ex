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
      <section class="content">
        <%=if @course_status.show_page=="add_course" do %>
        <%= live_component @socket, AddCourseComponent, id: :create_course %>
        <%=end %>
        <%=if @course_status.show_page=="course_list" do %>
        <%= live_component @socket, CourseListComponent, id: :course_list %>
        <%=end %>
      </section>
    """
  end




end
