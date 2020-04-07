defmodule HelloPhoenixLiveView.Course do
  @moduledoc """
  The Course context.
  """

  import Ecto.Query, warn: false
  alias HelloPhoenixLiveView.Repo

  alias HelloPhoenixLiveView.Course.CourseList

  @doc """
  Returns the list of course_list.

  ## Examples

      iex> list_course_list()
      [%CourseList{}, ...]

  """
  def list_course_list do
    Repo.all(CourseList)
  end

  @doc """
  Gets a single course_list.

  Raises `Ecto.NoResultsError` if the Course list does not exist.

  ## Examples

      iex> get_course_list!(123)
      %CourseList{}

      iex> get_course_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_course_list!(id), do: Repo.get!(CourseList, id)

  @doc """
  Creates a course_list.

  ## Examples

      iex> create_course_list(%{field: value})
      {:ok, %CourseList{}}

      iex> create_course_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_course_list(attrs \\ %{}) do
    %CourseList{}
    |> CourseList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a course_list.

  ## Examples

      iex> update_course_list(course_list, %{field: new_value})
      {:ok, %CourseList{}}

      iex> update_course_list(course_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_course_list(%CourseList{} = course_list, attrs) do
    course_list
    |> CourseList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a course_list.

  ## Examples

      iex> delete_course_list(course_list)
      {:ok, %CourseList{}}

      iex> delete_course_list(course_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_course_list(%CourseList{} = course_list) do
    Repo.delete(course_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking course_list changes.

  ## Examples

      iex> change_course_list(course_list)
      %Ecto.Changeset{source: %CourseList{}}

  """
  def change_course_list(%CourseList{} = course_list) do
    CourseList.changeset(course_list, %{})
  end
end
