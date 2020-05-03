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
    IO.inspect(socket.assigns, label: "validate_add_course>>>", pretty: true)
    changeset =
      socket.assigns.course_list
      |> Course.change_course_list(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end


  def handle_event("save", params, socket) do
    IO.inspect(params, label: "user_params<<<", pretty: true)
    case Accounts.create_user(params) do
      {:ok, user} ->
        {:stop,
         socket
         |> put_flash(:info, "User updated successfully.")
        #  |> redirect(to: Routes.live_path(socket, HelloPhoenixLiveViewWeb.LiveForm, %User{}))
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
