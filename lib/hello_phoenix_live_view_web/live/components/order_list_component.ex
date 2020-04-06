defmodule OrderListComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Accounts

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      订单列表
    """
  end



end
