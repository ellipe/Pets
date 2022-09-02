defmodule Pets.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :breed, :string
      add :birthdate, :date
      add :gender, :string

      timestamps()
    end
  end
end
