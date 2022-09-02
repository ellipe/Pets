defmodule Pets.Companion.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :birthdate, :date
    field :breed, :string
    field :gender, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :breed, :birthdate, :gender])
    |> validate_required([:name, :breed, :birthdate, :gender])
  end
end
