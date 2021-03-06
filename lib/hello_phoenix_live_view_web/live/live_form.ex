defmodule HelloPhoenixLiveViewWeb.LiveForm do
  use Phoenix.LiveView
  alias HelloPhoenixLiveViewWeb.LiveFormView

  alias HelloPhoenixLiveViewWeb.Router.Helpers, as: Routes
  alias HelloPhoenixLiveView.Accounts
  alias HelloPhoenixLiveView.Accounts.User

  def mount(params, _session, socket) do
    IO.inspect(params, label: "params>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:count, 0)
      |> assign(:username_validation, true)
    {:ok, socket}
  end

  def handle_params(_, _, socket) do
    # user = Accounts.get_user!(id)
    {:noreply,
     assign(socket, %{
       user: %User{},
       changeset: Accounts.change_user(%User{})
     })}
  end


  def render(assigns) do
    LiveFormView.render("index.html", assigns)
  end

  def handle_event("validate", %{"user" => params}, socket) do
    IO.inspect(params, label: "user==params>>>", pretty: true)
    changeset =
      socket.assigns.user
      |> Accounts.change_user(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, changeset: changeset)}
  end


  def handle_event("save", %{"user" => user_params}, socket) do
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
