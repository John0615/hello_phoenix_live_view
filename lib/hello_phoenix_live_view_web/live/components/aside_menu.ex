defmodule AsideMenu do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    menu_list = Accounts.list_menu()
    IO.inspect(menu_list, label: "menu1111>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:menu_list, menu_list)
    {:ok, socket}
  end

  def render(assigns) do
    HelloPhoenixLiveViewWeb.AsideMenuView.render("index.html", assigns)
  end

  def handle_event("select_menu", params, socket) do
    IO.inspect(params, label: "77777777>>>>>>", pretty: true)
    send self(), {:selected_menu, params}
    { :noreply, socket }
  end

end
