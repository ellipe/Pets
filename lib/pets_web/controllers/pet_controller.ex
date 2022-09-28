defmodule PetsWeb.PetController do
  use PetsWeb, :controller

  alias Pets.Companions
  alias Pets.Companions.Pet

  action_fallback PetsWeb.FallbackController

  alias PetsWeb.Plugs.RequireAuth
  plug RequireAuth

  def index(conn, _params) do
    pets = Companions.list_pets()
    render(conn, "index.json", pets: pets)
  end

  def create(conn, %{"pet" => pet_params}) do
    with {:ok, %Pet{} = pet} <- Companions.create_pet(pet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pet_path(conn, :show, pet))
      |> render("show.json", pet: pet)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Companions.get_pet!(id)
    render(conn, "show.json", pet: pet)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Companions.get_pet!(id)

    with {:ok, %Pet{} = pet} <- Companions.update_pet(pet, pet_params) do
      render(conn, "show.json", pet: pet)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Companions.get_pet!(id)

    with {:ok, %Pet{}} <- Companions.delete_pet(pet) do
      send_resp(conn, :no_content, "")
    end
  end
end
