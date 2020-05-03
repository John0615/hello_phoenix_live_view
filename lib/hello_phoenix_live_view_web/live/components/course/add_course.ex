defmodule AddCourseComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course
  alias HelloPhoenixLiveView.Course.CourseList


  def mount(socket) do
    socket =
      socket
      |> assign(:show_page, "add_course")
      |> assign(:changeset, Course.change_course_list(%CourseList{}))
      |> assign(:course_list, %CourseList{})
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.AddCourseView.render("index.html", assigns)
  end

  def handle_event("validate_add_course", %{"course_list" => params}, socket) do
    IO.inspect(params, label: "validate_add_course>>>", pretty: true)
    changeset =
      socket.assigns.course_list
      |> Course.change_course_list(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end


  def handle_event("save", %{"course_list" => params}, socket) do
    IO.inspect(params, label: "user_params<<<", pretty: true)
    case Course.create_course_list(params) do
      {:ok, _} ->
        send self(), {:show_course_list_page, %{}}
        {:noreply,
         socket
         |> put_flash(:info, "create course successfully.")
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
