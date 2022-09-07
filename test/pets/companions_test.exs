defmodule Pets.CompanionsTest do
  use Pets.DataCase

  alias Pets.Companions

  describe "pets" do
    alias Pets.Companions.Pet

    import Pets.CompanionsFixtures

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
      valid_attrs = %{
        birthdate: ~D[2022-09-01],
        breed: "some breed",
        gender: "some gender",
        name: "some name"
      }

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

      update_attrs = %{
        birthdate: ~D[2022-09-02],
        breed: "some updated breed",
        gender: "some updated gender",
        name: "some updated name"
      }

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

  describe "vaccines" do
    alias Pets.Companions.Vaccine

    import Pets.CompanionsFixtures

    @invalid_attrs %{name: nil, vaccination_dates: nil}

    test "list_vaccines/0 returns all vaccines" do
      vaccine = vaccine_fixture()
      assert Companions.list_vaccines() == [vaccine]
    end

    test "get_vaccine!/1 returns the vaccine with given id" do
      vaccine = vaccine_fixture()
      assert Companions.get_vaccine!(vaccine.id) == vaccine
    end

    test "create_vaccine/1 with valid data creates a vaccine" do
      valid_attrs = %{name: "some name", vaccination_dates: %{}}

      assert {:ok, %Vaccine{} = vaccine} = Companions.create_vaccine(valid_attrs)
      assert vaccine.name == "some name"
      assert vaccine.vaccination_dates == %{}
    end

    test "create_vaccine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companions.create_vaccine(@invalid_attrs)
    end

    test "update_vaccine/2 with valid data updates the vaccine" do
      vaccine = vaccine_fixture()
      update_attrs = %{name: "some updated name", vaccination_dates: %{}}

      assert {:ok, %Vaccine{} = vaccine} = Companions.update_vaccine(vaccine, update_attrs)
      assert vaccine.name == "some updated name"
      assert vaccine.vaccination_dates == %{}
    end

    test "update_vaccine/2 with invalid data returns error changeset" do
      vaccine = vaccine_fixture()
      assert {:error, %Ecto.Changeset{}} = Companions.update_vaccine(vaccine, @invalid_attrs)
      assert vaccine == Companions.get_vaccine!(vaccine.id)
    end

    test "delete_vaccine/1 deletes the vaccine" do
      vaccine = vaccine_fixture()
      assert {:ok, %Vaccine{}} = Companions.delete_vaccine(vaccine)
      assert_raise Ecto.NoResultsError, fn -> Companions.get_vaccine!(vaccine.id) end
    end

    test "change_vaccine/1 returns a vaccine changeset" do
      vaccine = vaccine_fixture()
      assert %Ecto.Changeset{} = Companions.change_vaccine(vaccine)
    end
  end

  describe "medications" do
    alias Pets.Companions.Medication

    import Pets.CompanionsFixtures

    @invalid_attrs %{dose: nil, name: nil, schedule: nil, unit: nil}

    test "list_medications/0 returns all medications" do
      medication = medication_fixture()
      assert Companions.list_medications() == [medication]
    end

    test "get_medication!/1 returns the medication with given id" do
      medication = medication_fixture()
      assert Companions.get_medication!(medication.id) == medication
    end

    test "create_medication/1 with valid data creates a medication" do
      valid_attrs = %{dose: 120.5, name: "some name", schedule: %{}, unit: "some unit"}

      assert {:ok, %Medication{} = medication} = Companions.create_medication(valid_attrs)
      assert medication.dose == 120.5
      assert medication.name == "some name"
      assert medication.schedule == %{}
      assert medication.unit == "some unit"
    end

    test "create_medication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companions.create_medication(@invalid_attrs)
    end

    test "update_medication/2 with valid data updates the medication" do
      medication = medication_fixture()
      update_attrs = %{dose: 456.7, name: "some updated name", schedule: %{}, unit: "some updated unit"}

      assert {:ok, %Medication{} = medication} = Companions.update_medication(medication, update_attrs)
      assert medication.dose == 456.7
      assert medication.name == "some updated name"
      assert medication.schedule == %{}
      assert medication.unit == "some updated unit"
    end

    test "update_medication/2 with invalid data returns error changeset" do
      medication = medication_fixture()
      assert {:error, %Ecto.Changeset{}} = Companions.update_medication(medication, @invalid_attrs)
      assert medication == Companions.get_medication!(medication.id)
    end

    test "delete_medication/1 deletes the medication" do
      medication = medication_fixture()
      assert {:ok, %Medication{}} = Companions.delete_medication(medication)
      assert_raise Ecto.NoResultsError, fn -> Companions.get_medication!(medication.id) end
    end

    test "change_medication/1 returns a medication changeset" do
      medication = medication_fixture()
      assert %Ecto.Changeset{} = Companions.change_medication(medication)
    end
  end
end
