defmodule PetsWeb.VaccineControllerTest do
  use PetsWeb.ConnCase

  import Pets.CompanionsFixtures

  alias Pets.Companions.Vaccine

  @create_attrs %{
    name: "some name",
    vaccination_dates: %{}
  }
  @update_attrs %{
    name: "some updated name",
    vaccination_dates: %{}
  }
  @invalid_attrs %{name: nil, vaccination_dates: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vaccines", %{conn: conn} do
      conn = get(conn, Routes.vaccine_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vaccine" do
    test "renders vaccine when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vaccine_path(conn, :create), vaccine: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vaccine_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name",
               "vaccination_dates" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vaccine_path(conn, :create), vaccine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vaccine" do
    setup [:create_vaccine]

    test "renders vaccine when data is valid", %{conn: conn, vaccine: %Vaccine{id: id} = vaccine} do
      conn = put(conn, Routes.vaccine_path(conn, :update, vaccine), vaccine: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vaccine_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "vaccination_dates" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vaccine: vaccine} do
      conn = put(conn, Routes.vaccine_path(conn, :update, vaccine), vaccine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vaccine" do
    setup [:create_vaccine]

    test "deletes chosen vaccine", %{conn: conn, vaccine: vaccine} do
      conn = delete(conn, Routes.vaccine_path(conn, :delete, vaccine))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vaccine_path(conn, :show, vaccine))
      end
    end
  end

  defp create_vaccine(_) do
    vaccine = vaccine_fixture()
    %{vaccine: vaccine}
  end
end
