defmodule PetsWeb.MedicationController do
  use PetsWeb, :controller

  alias Pets.Companions
  alias Pets.Companions.Medication

  action_fallback PetsWeb.FallbackController


  alias PetsWeb.Plugs.RequireAuth
  plug RequireAuth

  def index(conn, _params) do
    medications = Companions.list_medications()
    render(conn, "index.json", medications: medications)
  end

  def create(conn, %{"medication" => medication_params}) do
    with {:ok, %Medication{} = medication} <- Companions.create_medication(medication_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.medication_path(conn, :show, medication))
      |> render("show.json", medication: medication)
    end
  end

  def show(conn, %{"id" => id}) do
    medication = Companions.get_medication!(id)
    render(conn, "show.json", medication: medication)
  end

  def update(conn, %{"id" => id, "medication" => medication_params}) do
    medication = Companions.get_medication!(id)

    with {:ok, %Medication{} = medication} <- Companions.update_medication(medication, medication_params) do
      render(conn, "show.json", medication: medication)
    end
  end

  def delete(conn, %{"id" => id}) do
    medication = Companions.get_medication!(id)

    with {:ok, %Medication{}} <- Companions.delete_medication(medication) do
      send_resp(conn, :no_content, "")
    end
  end
end
