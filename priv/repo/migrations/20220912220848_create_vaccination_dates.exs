defmodule Pets.Repo.Migrations.CreateVaccinationDates do
  use Ecto.Migration

  def change do
    create table(:vaccination_dates) do
      add :immunization_date, :date
      add :veterinarian, :string
      add :status, :string

      timestamps()
    end
  end
end
