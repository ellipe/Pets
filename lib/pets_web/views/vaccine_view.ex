defmodule PetsWeb.VaccineView do
  use PetsWeb, :view
  alias PetsWeb.VaccineView
  alias PetsWeb.VaccinationDateView

  def render("index.json", %{vaccines: vaccines}) do
    %{data: render_many(vaccines, VaccineView, "vaccine.json")}
  end

  def render("show.json", %{vaccine: vaccine}) do
    %{data: render_one(vaccine, VaccineView, "vaccine.json")}
  end

  def render("vaccine.json", %{vaccine: vaccine}) do
    # TODO: this can be enhanced into a utility. render_association, follow assoc_loaded? pattern.
    case Ecto.assoc_loaded?(vaccine.vaccination_dates) do
      true ->
        %{
          id: vaccine.id,
          name: vaccine.name,
          status: vaccine.status,
          vaccination_dates: render_many(vaccine.vaccination_dates, VaccinationDateView, "vaccination_date.json")
        }
      _ ->
        %{
          id: vaccine.id,
          name: vaccine.name,
          status: vaccine.status,
        }
    end
  end
end
