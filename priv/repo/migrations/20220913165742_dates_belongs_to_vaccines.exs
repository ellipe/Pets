defmodule Pets.Repo.Migrations.DatesBelongsToVaccines do
  use Ecto.Migration

  def change do
    alter table(:vaccination_dates) do
      add :vaccine_id, references(:vaccines)
    end
  end
end
