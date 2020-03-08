defmodule HelloPhoenixLiveView.Repo do
  use Ecto.Repo,
    otp_app: :hello_phoenix_live_view,
    adapter: Ecto.Adapters.Postgres
end
