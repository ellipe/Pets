defmodule Pets.CompanionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pets.Companions` context.
  """

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    {:ok, pet} =
      attrs
      |> Enum.into(%{
        birthdate: ~D[2022-09-01],
        breed: "some breed",
        gender: "some gender",
        name: "some name"
      })
      |> Pets.Companions.create_pet()

    pet
  end

  @doc """
  Generate a vaccine.
  """
  def vaccine_fixture(attrs \\ %{}) do
    {:ok, vaccine} =
      attrs
      |> Enum.into(%{
        name: "some name",
        vaccination_dates: %{}
      })
      |> Pets.Companions.create_vaccine()

    vaccine
  end

  @doc """
  Generate a medication.
  """
  def medication_fixture(attrs \\ %{}) do
    {:ok, medication} =
      attrs
      |> Enum.into(%{
        dose: 120.5,
        name: "some name",
        schedule: %{},
        unit: "some unit"
      })
      |> Pets.Companions.create_medication()

    medication
  end

  @doc """
  Generate a vaccination_date.
  """
  def vaccination_date_fixture(attrs \\ %{}) do
    {:ok, vaccination_date} =
      attrs
      |> Enum.into(%{
        immunization_date: ~D[2022-09-11],
        status: "some status",
        veterinarian: "some veterinarian"
      })
      |> Pets.Companions.create_vaccination_date()

    vaccination_date
  end
end
