defmodule AsideMenuComponent do
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
    ~L"""
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="http://127.0.0.1:4000/images/avatar.png" style="width: 40px;" class="img-circle elevation-2" alt="User Image">
          </div>
          <div class="info">
            <a href="#" class="d-block">John</a>
          </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
                  with font-awesome or any other icon font library -->
            <%= for item <- @menu_list do %>
              <li class="nav-item">
                <a href="#" phx-click="select_menu" phx-value-url="<%= item.url %>" phx-target="#menu_<%= item.id %>" id="menu_<%= item.id %>" class="nav-link <%= if @content==item.url, do: "active" %>">
                  <i class="nav-icon far <%= item.icon %>"></i>
                  <p><%= item.title %></p>
                </a>
              </li>
            <%= end  %>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
    """
  end

  def handle_event("select_menu", params, socket) do
    IO.inspect(params, label: "77777777>>>>>>", pretty: true)
    send self(), {:selected_menu, params}
    { :noreply, socket }
  end

end
