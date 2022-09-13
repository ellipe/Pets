defmodule PetsWeb.VaccinationDateView do
  use PetsWeb, :view
  alias PetsWeb.VaccinationDateView

  def render("index.json", %{vaccination_dates: vaccination_dates}) do
    %{data: render_many(vaccination_dates, VaccinationDateView, "vaccination_date.json")}
  end

  def render("show.json", %{vaccination_date: vaccination_date}) do
    %{data: render_one(vaccination_date, VaccinationDateView, "vaccination_date.json")}
  end

  def render("vaccination_date.json", %{vaccination_date: vaccination_date}) do
    %{
      id: vaccination_date.id,
      immunization_date: vaccination_date.immunization_date,
      veterinarian: vaccination_date.veterinarian,
      status: vaccination_date.status
    }
  end
end
