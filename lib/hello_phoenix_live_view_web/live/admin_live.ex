defmodule HelloPhoenixLiveViewWeb.AdminLive do
  use Phoenix.LiveView
  alias HelloPhoenixLiveViewWeb.AdminLiveView

  alias HelloPhoenixLiveViewWeb.Router.Helpers, as: Routes
  alias HelloPhoenixLiveView.Accounts
  alias HelloPhoenixLiveView.Accounts.User

  def mount(_params, _session, socket) do
    init_status = %{
      content: "dashboard",
      course: %{
        show_page: "course_list"
      }
    }
    socket =
      socket
      |> assign(:init_status, init_status)
    {:ok, socket}
  end


  def render(assigns) do
    AdminLiveView.render("index.html", assigns)
  end

  def handle_event("validate", %{"user" => params}, socket) do
    IO.inspect(params, label: "login==params>>>", pretty: true)
    changeset =
      socket.assigns.user
      |> Accounts.change_user(params)
      |> IO.inspect(label: "11111111>>>>>>", pretty: true)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end


  def handle_event("login", %{"user" => user_params}, socket) do
    IO.inspect(user_params, label: "user_params<<<", pretty: true)
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        {:stop,
         socket
         |> put_flash(:info, "User updated successfully.")
         |> redirect(to: Routes.live_path(socket, HelloPhoenixLiveViewWeb.LiveForm, %User{}))
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_info({:selected_menu, card}, socket) do
    # update the list of cards in the socket
    IO.inspect(socket, label: "socket<<<", pretty: true)
    socket = assign(socket, :init_status, Map.put(socket.assigns.init_status, :content, card["url"]))
    {:noreply, socket}
  end

  def handle_info({:show_create_course_page, _}, socket) do
    # update the list of cards in the socket
    IO.inspect(socket, label: "socket<<<", pretty: true)
    course_status = socket.assigns.init_status.course
    new_course_status = Map.put(course_status, :show_page, "add_course")
    IO.inspect(new_course_status, label: "new_course_status<<<", pretty: true)
    socket = assign(socket, :init_status, Map.put(socket.assigns.init_status, :course, new_course_status))
    {:noreply, socket}
  end

  def handle_event("increment", _, socket) do
    count = socket.assigns.count + 1
    socket = assign(socket, :count, count)
    { :noreply, socket }
  end

  def handle_event("decrement", _, socket) do
    count = socket.assigns.count - 1
    socket = assign(socket, :count, count)
    { :noreply, socket }
  end

end
