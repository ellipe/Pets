defmodule Pets.CompanionTest do
  use Pets.DataCase

  alias Pets.Companion

  describe "pets" do
    alias Pets.Companion.Pet

    import Pets.CompanionFixtures

    @invalid_attrs %{birthdate: nil, breed: nil, gender: nil, name: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Companion.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Companion.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{birthdate: ~D[2022-09-01], breed: "some breed", gender: "some gender", name: "some name"}

      assert {:ok, %Pet{} = pet} = Companion.create_pet(valid_attrs)
      assert pet.birthdate == ~D[2022-09-01]
      assert pet.breed == "some breed"
      assert pet.gender == "some gender"
      assert pet.name == "some name"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companion.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{birthdate: ~D[2022-09-02], breed: "some updated breed", gender: "some updated gender", name: "some updated name"}

      assert {:ok, %Pet{} = pet} = Companion.update_pet(pet, update_attrs)
      assert pet.birthdate == ~D[2022-09-02]
      assert pet.breed == "some updated breed"
      assert pet.gender == "some updated gender"
      assert pet.name == "some updated name"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Companion.update_pet(pet, @invalid_attrs)
      assert pet == Companion.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Companion.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Companion.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Companion.change_pet(pet)
    end
  end
end
