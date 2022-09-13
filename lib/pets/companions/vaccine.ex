defmodule Pets.Companions.Vaccine do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pets.Companions.VaccinationDate

  schema "vaccines" do
    field :name, :string
    field :status, Ecto.Enum, values: [:enabled, :disabled]

    has_many :vaccination_dates, VaccinationDate

    timestamps()
  end

  @doc false
  def changeset(vaccine, attrs) do
    vaccine
    |> cast(attrs, [:name, :status])
    |> validate_required([:name])
  end
end
