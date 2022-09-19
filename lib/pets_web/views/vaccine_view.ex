defmodule PetsWeb.VaccineView do
  use PetsWeb, :view
  alias PetsWeb.VaccineView
  alias PetsWeb.VaccinationDateView

  import Helpers.RenderRelationship

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
      vaccination_dates: render_relationship(vaccine.vaccination_dates, VaccinationDateView, "vaccination_date.json")
    }
  end
end
