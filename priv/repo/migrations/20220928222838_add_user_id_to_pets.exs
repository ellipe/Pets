defmodule Pets.Repo.Migrations.AddUserIdToPets do
  use Ecto.Migration
  def change do
    alter table :pets do
      add :user_id, references(:pets)
    end
  end
end
