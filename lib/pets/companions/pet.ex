defmodule Pets.Companions.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pets.Accounts.User

  schema "pets" do
    field :birthdate, :date
    field :breed, :string
    field :gender, Ecto.Enum, values: [:Female, :Male]
    field :name, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :breed, :birthdate, :gender])
    |> validate_required([:name, :breed, :birthdate, :gender])
  end
end
