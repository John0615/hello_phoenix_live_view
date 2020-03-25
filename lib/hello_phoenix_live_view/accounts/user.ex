defmodule HelloPhoenixLiveView.Accounts.User do
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
    |> validate_required(:name, message: "用户名不能为空！" )
    |> validate_required(:phone, message: "电话不能为空" )
    |> validate_required(:email, message: "邮箱不能为空" )
    |> validate_required(:password, message: "密码不能为空！" )
  end
end
