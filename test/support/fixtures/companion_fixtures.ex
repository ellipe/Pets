defmodule Pets.CompanionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pets.Companion` context.
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
      |> Pets.Companion.create_pet()

    pet
  end
end
