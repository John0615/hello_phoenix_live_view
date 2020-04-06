defmodule DashboardComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <p style="text-align: center;">少儿英语后台管理系统</p>
    """
  end


end
