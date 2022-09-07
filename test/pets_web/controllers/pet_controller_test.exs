defmodule PetsWeb.PetControllerTest do
  use PetsWeb.ConnCase

  import Pets.CompanionsFixtures

  alias Pets.Companions.Pet

  @create_attrs %{
    birthdate: ~D[2022-09-01],
    breed: "some breed",
    gender: "some gender",
    name: "some name"
  }
  @update_attrs %{
    birthdate: ~D[2022-09-02],
    breed: "some updated breed",
    gender: "some updated gender",
    name: "some updated name"
  }
  @invalid_attrs %{birthdate: nil, breed: nil, gender: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pet" do
    test "renders pet when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pet_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "birthdate" => "2022-09-01",
               "breed" => "some breed",
               "gender" => "some gender",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "renders pet when data is valid", %{conn: conn, pet: %Pet{id: id} = pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pet_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "birthdate" => "2022-09-02",
               "breed" => "some updated breed",
               "gender" => "some updated gender",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, Routes.pet_path(conn, :delete, pet))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pet_path(conn, :show, pet))
      end
    end
  end

  defp create_pet(_) do
    pet = pet_fixture()
    %{pet: pet}
  end
end
