defmodule Pets.Repo.Migrations.CreateVaccines do
  use Ecto.Migration

  def change do
    create table(:vaccines) do
      add :name, :string
      add :vaccination_dates, :map

      timestamps()
    end
  end
end
