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
end
