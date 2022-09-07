defmodule Pets.Repo.Migrations.CreateMedications do
  use Ecto.Migration

  def change do
    create table(:medications) do
      add :name, :string
      add :dose, :float
      add :unit, :string
      add :schedule, :map

      timestamps()
    end
  end
end
