defmodule HelloPhoenixLiveViewWeb.LiveForm do
  use Phoenix.LiveView
  use Phoenix.HTML

  def mount(params, _session, socket) do
    IO.inspect(params, label: "params>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:count, 0)
      |> assign(:username_validation, true)
    {:ok, socket}
  end


  def render(assigns) do
    ~L"""
    <h1>Count: <%= @count %></h1>

    <button phx-click="increment">+</button>
    <button phx-click="decrement">-</button>
    <form class="pure-form pure-form-aligned">
      <fieldset>
        <div class="pure-control-group">
            <label for="name">用户名</label>
            <input id="name" type="text" placeholder="用户名">
            <span class="pure-form-message-inline <%= if @username_validation == false do "input-varning" else "input-pass" end %> ">用户名不能为空!</span>
        </div>

        <div class="pure-control-group">
            <label for="password">密码</label>
            <input id="password" type="password" placeholder="密码">
        </div>

        <div class="pure-control-group">
            <label for="email">邮箱</label>
            <input id="email" type="email" placeholder="邮箱">
        </div>

        <div class="pure-control-group">
            <label for="foo">手机号吗</label>
            <input id="foo" type="text" placeholder="手机号码">
        </div>

        <div class="pure-controls">
          <label for="cb" class="pure-checkbox">
              <input id="cb" type="checkbox"> 我已阅读条款
          </label>
          <%= submit "Save" %>

        </div>
      </fieldset>
    </form>
    """
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
end
