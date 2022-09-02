defmodule PetsWeb.PetView do
  use PetsWeb, :view
  alias PetsWeb.PetView

  def render("index.json", %{pets: pets}) do
    %{data: render_many(pets, PetView, "pet.json")}
  end

  def render("show.json", %{pet: pet}) do
    %{data: render_one(pet, PetView, "pet.json")}
  end

  def render("pet.json", %{pet: pet}) do
    %{
      id: pet.id,
      name: pet.name,
      breed: pet.breed,
      birthdate: pet.birthdate,
      gender: pet.gender
    }
  end
end
