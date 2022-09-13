defmodule PetsWeb.VaccinationDateControllerTest do
  use PetsWeb.ConnCase

  import Pets.CompanionsFixtures

  alias Pets.Companions.VaccinationDate

  @create_attrs %{
    immunization_date: ~D[2022-09-11],
    status: "some status",
    veterinarian: "some veterinarian"
  }
  @update_attrs %{
    immunization_date: ~D[2022-09-12],
    status: "some updated status",
    veterinarian: "some updated veterinarian"
  }
  @invalid_attrs %{immunization_date: nil, status: nil, veterinarian: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vaccination_dates", %{conn: conn} do
      conn = get(conn, Routes.vaccination_date_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vaccination_date" do
    test "renders vaccination_date when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vaccination_date_path(conn, :create), vaccination_date: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vaccination_date_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "immunization_date" => "2022-09-11",
               "status" => "some status",
               "veterinarian" => "some veterinarian"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vaccination_date_path(conn, :create), vaccination_date: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vaccination_date" do
    setup [:create_vaccination_date]

    test "renders vaccination_date when data is valid", %{conn: conn, vaccination_date: %VaccinationDate{id: id} = vaccination_date} do
      conn = put(conn, Routes.vaccination_date_path(conn, :update, vaccination_date), vaccination_date: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vaccination_date_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "immunization_date" => "2022-09-12",
               "status" => "some updated status",
               "veterinarian" => "some updated veterinarian"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vaccination_date: vaccination_date} do
      conn = put(conn, Routes.vaccination_date_path(conn, :update, vaccination_date), vaccination_date: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vaccination_date" do
    setup [:create_vaccination_date]

    test "deletes chosen vaccination_date", %{conn: conn, vaccination_date: vaccination_date} do
      conn = delete(conn, Routes.vaccination_date_path(conn, :delete, vaccination_date))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vaccination_date_path(conn, :show, vaccination_date))
      end
    end
  end

  defp create_vaccination_date(_) do
    vaccination_date = vaccination_date_fixture()
    %{vaccination_date: vaccination_date}
  end
end
