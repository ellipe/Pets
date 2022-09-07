defmodule Pets.Companions.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medications" do
    field :dose, :float
    field :name, :string
    field :schedule, :map
    field :unit, :string

    timestamps()
  end

  @doc false
  def changeset(medication, attrs) do
    medication
    |> cast(attrs, [:name, :dose, :unit, :schedule])
    |> validate_required([:name, :dose, :unit, :schedule])
  end
end
