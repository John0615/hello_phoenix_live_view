defmodule HelloPhoenixLiveView.Accounts.Menu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menu" do
    field :icon, :string
    field :isAuth, :integer
    field :pid, :integer
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(menu, attrs) do
    menu
    |> cast(attrs, [:id, :pid, :title, :icon, :url, :isAuth])
    |> validate_required([:id, :pid, :title, :icon, :url, :isAuth])
  end
end
