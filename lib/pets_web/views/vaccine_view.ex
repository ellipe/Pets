defmodule PetsWeb.VaccineView do
  use PetsWeb, :view
  alias PetsWeb.VaccineView

  def render("index.json", %{vaccines: vaccines}) do
    %{data: render_many(vaccines, VaccineView, "vaccine.json")}
  end

  def render("show.json", %{vaccine: vaccine}) do
    %{data: render_one(vaccine, VaccineView, "vaccine.json")}
  end

  def render("vaccine.json", %{vaccine: vaccine}) do
    %{
      id: vaccine.id,
      name: vaccine.name,
      vaccination_dates: vaccine.vaccination_dates
    }
  end
end
