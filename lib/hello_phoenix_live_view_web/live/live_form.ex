defmodule HelloPhoenixLiveViewWeb.LiveForm do
  use Phoenix.LiveView
  use Phoenix.HTML
  alias HelloPhoenixLiveViewWeb.LiveFormView

  def mount(params, _session, socket) do
    IO.inspect(params, label: "params>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:count, 0)
      |> assign(:username_validation, true)
    {:ok, socket}
  end


  def render(assigns) do
    LiveFormView.render("index.html", assigns)
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

  def handle_event("save", _, socket) do
    # IO.inspect(LiveViewForm, label: "params>>>>>> ", pretty: true)
    socket = assign(socket, :username_validation, false)
    { :noreply, socket }
  end


  def handle_event("add", params, socket) do
    IO.inspect(params, label: "params>>>>>> ", pretty: true)
    socket = assign(socket, :username_validation, false)
    { :noreply, socket }
  end
end
