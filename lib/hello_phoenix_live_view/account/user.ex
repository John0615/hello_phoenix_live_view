defmodule HelloPhoenixLiveView.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :phone, :email, :password])
    |> validate_required([:name, :phone, :email, :password])
  end
end
