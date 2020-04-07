defmodule HelloPhoenixLiveView.Repo.Migrations.CreateCourseList do
  use Ecto.Migration

  def change do
    create table(:course_list) do
      add :id, :integer
      add :course_name, :string
      add :course_type, :string
      add :course_level, :string
      add :price, :integer
      add :class_hour, :integer
      add :each_class_hour, :integer
      add :overall_rate, :integer
      add :desc, :string
      add :thumbnail, :string
      add :detail, :string
      add :status, :string
      add :is_deleted, :integer

      timestamps()
    end

  end
end
