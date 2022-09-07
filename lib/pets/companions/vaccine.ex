defmodule Pets.Companions.Vaccine do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pets.Companions.Vaccine.VaccinationDate

  schema "vaccines" do
    field :name, :string
    embeds_many :vaccination_dates, VaccinationDate

    timestamps()
  end

  @doc false
  def changeset(vaccine, attrs) do
    vaccine
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> cast_embed(:vaccination_dates, required: false)
  end
end
