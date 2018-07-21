defmodule TimelineWeb.ClientControllerTest do
  use TimelineWeb.ConnCase

  alias Timeline.Work
  alias Timeline.Work.Client

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:client) do
    {:ok, client} = Work.create_client(@create_attrs)
    client
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get conn, client_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create client" do
    test "renders client when data is valid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, client_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, client_path(conn, :create), client: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update client" do
    setup [:create_client]

    test "renders client when data is valid", %{conn: conn, client: %Client{id: id} = client} do
      conn = put conn, client_path(conn, :update, client), client: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, client_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete conn, client_path(conn, :delete, client)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, client_path(conn, :show, client)
      end
    end
  end

  defp create_client(_) do
    client = fixture(:client)
    {:ok, client: client}
  end
end
