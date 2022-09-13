defmodule PetsWeb.VaccinationDateController do
  use PetsWeb, :controller

  alias Pets.Companions
  alias Pets.Companions.VaccinationDate

  action_fallback PetsWeb.FallbackController

  def index(conn, _params) do
    vaccination_dates = Companions.list_vaccination_dates()
    render(conn, "index.json", vaccination_dates: vaccination_dates)
  end

  def create(conn, %{"vaccination_date" => vaccination_date_params}) do
    with {:ok, %VaccinationDate{} = vaccination_date} <- Companions.create_vaccination_date(vaccination_date_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.vaccination_date_path(conn, :show, vaccination_date))
      |> render("show.json", vaccination_date: vaccination_date)
    end
  end

  def show(conn, %{"id" => id}) do
    vaccination_date = Companions.get_vaccination_date!(id)
    render(conn, "show.json", vaccination_date: vaccination_date)
  end

  def update(conn, %{"id" => id, "vaccination_date" => vaccination_date_params}) do
    vaccination_date = Companions.get_vaccination_date!(id)

    with {:ok, %VaccinationDate{} = vaccination_date} <- Companions.update_vaccination_date(vaccination_date, vaccination_date_params) do
      render(conn, "show.json", vaccination_date: vaccination_date)
    end
  end

  def delete(conn, %{"id" => id}) do
    vaccination_date = Companions.get_vaccination_date!(id)

    with {:ok, %VaccinationDate{}} <- Companions.delete_vaccination_date(vaccination_date) do
      send_resp(conn, :no_content, "")
    end
  end
end
