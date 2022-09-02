defmodule Pets.Repo do
  use Ecto.Repo,
    otp_app: :pets,
    adapter: Ecto.Adapters.Postgres
end
