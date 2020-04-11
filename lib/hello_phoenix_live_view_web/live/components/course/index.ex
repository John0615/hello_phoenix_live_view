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
        <%=if @show_page=="add_course" do %>
        <%= live_component @socket, AddCourseComponent, id: :create_course %>
        <%=end %>
        <%=if @show_page=="course_list" do %>
        <%= live_component @socket, CourseListComponent, id: :course_list %>
        <%=end %>
      </section>
    """
  end


  def handle_info({:show_create_course_page, params}, socket) do
    # update the list of cards in the socket
    IO.inspect(params, label: "params<<<", pretty: true)
    socket = assign(socket, :show_page, params["show-page"])
    {:noreply, socket}
  end

end
