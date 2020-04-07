defmodule HelloPhoenixLiveView.CourseTest do
  use HelloPhoenixLiveView.DataCase

  alias HelloPhoenixLiveView.Course

  describe "course_list" do
    alias HelloPhoenixLiveView.Course.CourseList

    @valid_attrs %{class_hour: 42, course_level: "some course_level", course_name: "some course_name", course_type: "some course_type", desc: "some desc", detail: "some detail", each_class_hour: 42, id: 42, is_deleted: 42, overall_rate: 42, price: 42, status: "some status", thumbnail: "some thumbnail"}
    @update_attrs %{class_hour: 43, course_level: "some updated course_level", course_name: "some updated course_name", course_type: "some updated course_type", desc: "some updated desc", detail: "some updated detail", each_class_hour: 43, id: 43, is_deleted: 43, overall_rate: 43, price: 43, status: "some updated status", thumbnail: "some updated thumbnail"}
    @invalid_attrs %{class_hour: nil, course_level: nil, course_name: nil, course_type: nil, desc: nil, detail: nil, each_class_hour: nil, id: nil, is_deleted: nil, overall_rate: nil, price: nil, status: nil, thumbnail: nil}

    def course_list_fixture(attrs \\ %{}) do
      {:ok, course_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Course.create_course_list()

      course_list
    end

    test "list_course_list/0 returns all course_list" do
      course_list = course_list_fixture()
      assert Course.list_course_list() == [course_list]
    end

    test "get_course_list!/1 returns the course_list with given id" do
      course_list = course_list_fixture()
      assert Course.get_course_list!(course_list.id) == course_list
    end

    test "create_course_list/1 with valid data creates a course_list" do
      assert {:ok, %CourseList{} = course_list} = Course.create_course_list(@valid_attrs)
      assert course_list.class_hour == 42
      assert course_list.course_level == "some course_level"
      assert course_list.course_name == "some course_name"
      assert course_list.course_type == "some course_type"
      assert course_list.desc == "some desc"
      assert course_list.detail == "some detail"
      assert course_list.each_class_hour == 42
      assert course_list.id == 42
      assert course_list.is_deleted == 42
      assert course_list.overall_rate == 42
      assert course_list.price == 42
      assert course_list.status == "some status"
      assert course_list.thumbnail == "some thumbnail"
    end

    test "create_course_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Course.create_course_list(@invalid_attrs)
    end

    test "update_course_list/2 with valid data updates the course_list" do
      course_list = course_list_fixture()
      assert {:ok, %CourseList{} = course_list} = Course.update_course_list(course_list, @update_attrs)
      assert course_list.class_hour == 43
      assert course_list.course_level == "some updated course_level"
      assert course_list.course_name == "some updated course_name"
      assert course_list.course_type == "some updated course_type"
      assert course_list.desc == "some updated desc"
      assert course_list.detail == "some updated detail"
      assert course_list.each_class_hour == 43
      assert course_list.id == 43
      assert course_list.is_deleted == 43
      assert course_list.overall_rate == 43
      assert course_list.price == 43
      assert course_list.status == "some updated status"
      assert course_list.thumbnail == "some updated thumbnail"
    end

    test "update_course_list/2 with invalid data returns error changeset" do
      course_list = course_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Course.update_course_list(course_list, @invalid_attrs)
      assert course_list == Course.get_course_list!(course_list.id)
    end

    test "delete_course_list/1 deletes the course_list" do
      course_list = course_list_fixture()
      assert {:ok, %CourseList{}} = Course.delete_course_list(course_list)
      assert_raise Ecto.NoResultsError, fn -> Course.get_course_list!(course_list.id) end
    end

    test "change_course_list/1 returns a course_list changeset" do
      course_list = course_list_fixture()
      assert %Ecto.Changeset{} = Course.change_course_list(course_list)
    end
  end
end
