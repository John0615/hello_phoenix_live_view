defmodule HelloPhoenixLiveView.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :phone, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

  end
end
