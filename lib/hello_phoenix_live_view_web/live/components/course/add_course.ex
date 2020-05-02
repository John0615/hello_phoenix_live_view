defmodule AddCourseComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts
  alias HelloPhoenixLiveView.Accounts.User


  def mount(socket) do
    socket =
      socket
      |> assign(:show_page, "add_course")
      |> assign(:changeset, Accounts.change_user(%User{}))
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.AddCourseView.render("index.html", assigns)
  end

  def handle_event("validate_add_course", %{"user" => params}, socket) do
    IO.inspect(params, label: "params1111222333444==params>>>", pretty: true)
    changeset =
      socket.assigns.user
      # |> Accounts.change_user(params)
      # |> Map.put(:action, :update)

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
