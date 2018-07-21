defmodule Timeline.WorkTest do
  use Timeline.DataCase

  alias Timeline.Work

  describe "clients" do
    alias Timeline.Work.Client

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Work.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Work.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Work.create_client(@valid_attrs)
      assert client.name == "some name"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Work.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.name == "some updated name"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_client(client, @invalid_attrs)
      assert client == Work.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Work.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Work.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Work.change_client(client)
    end
  end

  describe "projects" do
    alias Timeline.Work.Project

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Work.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Work.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Work.create_project(@valid_attrs)
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Work.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_project(project, @invalid_attrs)
      assert project == Work.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Work.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Work.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Work.change_project(project)
    end
  end
end
