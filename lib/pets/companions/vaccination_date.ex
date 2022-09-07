defmodule Pets.Companions.Vaccine.VaccinationDate do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pets.Companions.Vaccine.VaccinationDate

  embedded_schema do
    field :immunization_date, :date
    field :veterinarian, :string
    field :status, Ecto.Enum, values: [:applied, :pending, :rejected]
  end

  def changeset(%VaccinationDate{} = vaccination_date, attrs \\ %{}) do
    vaccination_date
    |> cast(attrs, [:immunization_date, :veterinarian, :status])
    |> validate_required([:immunization_date, :status])
  end
end
