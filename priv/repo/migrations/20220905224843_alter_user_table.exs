defmodule Pets.Repo.Migrations.AlterUserTable do
  use Ecto.Migration

  def change do
    rename table(:users), :encrypted_password, to: :password
  end
end
