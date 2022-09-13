defmodule Pets.Repo.Migrations.CreateVaccines do
  use Ecto.Migration

  def change do
    create table(:vaccines) do
      add :name, :string
      add :status, :string, default: "enabled"

      timestamps()
    end
  end
end
