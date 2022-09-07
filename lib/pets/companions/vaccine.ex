defmodule Pets.Companions.Vaccine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vaccines" do
    field :name, :string
    field :vaccination_dates, :map

    timestamps()
  end

  @doc false
  def changeset(vaccine, attrs) do
    vaccine
    |> cast(attrs, [:name, :vaccination_dates])
    |> validate_required([:name])
  end
end
