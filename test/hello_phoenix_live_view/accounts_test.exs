defmodule HelloPhoenixLiveView.AccountsTest do
  use HelloPhoenixLiveView.DataCase

  alias HelloPhoenixLiveView.Accounts

  describe "users" do
    alias HelloPhoenixLiveView.Accounts.User

    @valid_attrs %{email: "some email", name: "some name", password: "some password", phone: "some phone"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password", phone: "some updated phone"}
    @invalid_attrs %{email: nil, name: nil, password: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "menu" do
    alias HelloPhoenixLiveView.Accounts.Menu

    @valid_attrs %{icon: "some icon", id: 42, isAuth: 42, pid: 42, title: "some title", url: "some url"}
    @update_attrs %{icon: "some updated icon", id: 43, isAuth: 43, pid: 43, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{icon: nil, id: nil, isAuth: nil, pid: nil, title: nil, url: nil}

    def menu_fixture(attrs \\ %{}) do
      {:ok, menu} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_menu()

      menu
    end

    test "list_menu/0 returns all menu" do
      menu = menu_fixture()
      assert Accounts.list_menu() == [menu]
    end

    test "get_menu!/1 returns the menu with given id" do
      menu = menu_fixture()
      assert Accounts.get_menu!(menu.id) == menu
    end

    test "create_menu/1 with valid data creates a menu" do
      assert {:ok, %Menu{} = menu} = Accounts.create_menu(@valid_attrs)
      assert menu.icon == "some icon"
      assert menu.id == 42
      assert menu.isAuth == 42
      assert menu.pid == 42
      assert menu.title == "some title"
      assert menu.url == "some url"
    end

    test "create_menu/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_menu(@invalid_attrs)
    end

    test "update_menu/2 with valid data updates the menu" do
      menu = menu_fixture()
      assert {:ok, %Menu{} = menu} = Accounts.update_menu(menu, @update_attrs)
      assert menu.icon == "some updated icon"
      assert menu.id == 43
      assert menu.isAuth == 43
      assert menu.pid == 43
      assert menu.title == "some updated title"
      assert menu.url == "some updated url"
    end

    test "update_menu/2 with invalid data returns error changeset" do
      menu = menu_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_menu(menu, @invalid_attrs)
      assert menu == Accounts.get_menu!(menu.id)
    end

    test "delete_menu/1 deletes the menu" do
      menu = menu_fixture()
      assert {:ok, %Menu{}} = Accounts.delete_menu(menu)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_menu!(menu.id) end
    end

    test "change_menu/1 returns a menu changeset" do
      menu = menu_fixture()
      assert %Ecto.Changeset{} = Accounts.change_menu(menu)
    end
  end
end
