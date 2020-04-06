defmodule DashboardComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      少儿英语后台管理系统
    """
  end


end
