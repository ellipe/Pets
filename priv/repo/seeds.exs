# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pets.Repo.insert!(%Pets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pets.Repo
alias Pets.Companion.Pet

Repo.insert!(%Pet{name: "Chiquita", breed: "Pinchee", gender: "Female", birthdate: ~D[2003-05-01]})

Repo.insert!(%Pet{
  name: "Canela",
  breed: "Jack Russel Terrier",
  gender: "Female",
  birthdate: ~D[2003-05-01]
})

Repo.insert!(%Pet{
  name: "Macarena",
  breed: "Jack Russel Terrier",
  gender: "Female",
  birthdate: ~D[2003-05-01]
})
