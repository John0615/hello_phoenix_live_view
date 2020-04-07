defmodule HelloPhoenixLiveView.Course.CourseList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "course_list" do
    field :class_hour, :integer
    field :course_level, :string
    field :course_name, :string
    field :course_type, :string
    field :desc, :string
    field :detail, :string
    field :each_class_hour, :integer
    field :id, :integer
    field :is_deleted, :integer
    field :overall_rate, :integer
    field :price, :integer
    field :status, :string
    field :thumbnail, :string

    timestamps()
  end

  @doc false
  def changeset(course_list, attrs) do
    course_list
    |> cast(attrs, [:id, :course_name, :course_type, :course_level, :price, :class_hour, :each_class_hour, :overall_rate, :desc, :thumbnail, :detail, :status, :is_deleted])
    |> validate_required([:id, :course_name, :course_type, :course_level, :price, :class_hour, :each_class_hour, :overall_rate, :desc, :thumbnail, :detail, :status, :is_deleted])
  end
end
