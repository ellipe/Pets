defmodule Pets.Companions.VaccinationDate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vaccination_dates" do
    field :immunization_date, :date
    field :status, Ecto.Enum, values: [:applied, :pending, :rejected]
    field :veterinarian, :string

    timestamps()
  end

  @doc false
  def changeset(vaccination_date, attrs) do
    vaccination_date
    |> cast(attrs, [:immunization_date, :veterinarian, :status])
    |> validate_required([:immunization_date, :veterinarian, :status])
  end
end
