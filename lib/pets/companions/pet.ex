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

  def assoc(struct \\ %User{}) do
    # this is super weird pattern...
    # basically from here I'm saying, create a new changeset of type Pets using the linked record, in this case the user.
    # %User{...} |> Ecto.build_assoc(:pets) returns a changeset like %Pet{user_id: XXX} that can be used in the changeset method created above.
    struct |> Ecto.build_assoc(:pets)
  end
end
