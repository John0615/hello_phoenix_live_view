defmodule HelloPhoenixLiveView.Repo.Migrations.CreateMenu do
  use Ecto.Migration

  def change do
    create table(:menu) do
      add :pid, :integer
      add :title, :string
      add :icon, :string
      add :url, :string
      add :isAuth, :integer

      timestamps()
    end

  end
end
