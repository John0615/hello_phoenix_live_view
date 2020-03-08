defmodule HelloPhoenixLiveViewWeb.TestLive.Index do
  import Phoenix.LiveView.Controller

  def index(conn, %{}) do
    live_render(conn, ThermostatLive, session: %{})
  end
end
