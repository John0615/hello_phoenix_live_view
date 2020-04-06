defmodule AsideMenuComponent do
  use Phoenix.LiveComponent


  def render(assigns) do
    ~L"""
    <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Sidebar -->
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
                  <a href="#" phx-click="select_menu" phx-target="#menu_<%= item.id %>" id="menu_<%= item.id %>" class="nav-link">
                    <i class="nav-icon far <%= item.icon %>"></i>
                    <p><%= item.title %></p>
                  </a>
                </li>
              <%= end  %>
            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
      </aside>
    """
  end

  # def handle_event("select_menu", params, socket) do
  #   IO.inspect(params, label: "77777777>>>>>>", pretty: true)
  #   count = socket.assigns.count + 1
  #   socket = assign(socket, :count, count)
  #   { :noreply, socket }
  # end

end
