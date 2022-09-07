defmodule PetsWeb.MedicationView do
  use PetsWeb, :view
  alias PetsWeb.MedicationView

  def render("index.json", %{medications: medications}) do
    %{data: render_many(medications, MedicationView, "medication.json")}
  end

  def render("show.json", %{medication: medication}) do
    %{data: render_one(medication, MedicationView, "medication.json")}
  end

  def render("medication.json", %{medication: medication}) do
    %{
      id: medication.id,
      name: medication.name,
      dose: medication.dose,
      unit: medication.unit,
      schedule: medication.schedule
    }
  end
end
