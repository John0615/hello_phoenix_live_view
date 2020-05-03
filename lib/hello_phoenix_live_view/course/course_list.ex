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
    # |> validate_required([:id, :course_name, :course_type, :course_level, :price, :class_hour, :each_class_hour, :overall_rate, :desc, :thumbnail, :detail, :status, :is_deleted])
    |> validate_required(:course_name, message: "课程名称不能为空!" )
    |> validate_required(:course_type, message: "课程类型不能为空!" )
    |> validate_required(:course_level, message: "课程级别不能为空!" )
    |> validate_required(:price, message: "价格不能为空!" )
    |> validate_required(:class_hour, message: "课时不能为空!" )
    |> validate_required(:desc, message: "简介不能为空!")
    # |> validate_required(:detail, message: "详情不能为空!")

  end
end
