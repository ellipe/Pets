defmodule PetsWeb.VaccineController do
  use PetsWeb, :controller

  alias Pets.Companions
  alias Pets.Companions.Vaccine

  action_fallback PetsWeb.FallbackController

  def index(conn, _params) do
    vaccines = Companions.list_vaccines()
    render(conn, "index.json", vaccines: vaccines)
  end

  def create(conn, %{"vaccine" => vaccine_params}) do
    with {:ok, %Vaccine{} = vaccine} <- Companions.create_vaccine(vaccine_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.vaccine_path(conn, :show, vaccine))
      |> render("show.json", vaccine: vaccine)
    end
  end

  def show(conn, %{"id" => id}) do
    vaccine = Companions.get_vaccine!(id)
    render(conn, "show.json", vaccine: vaccine)
  end

  def update(conn, %{"id" => id, "vaccine" => vaccine_params}) do
    vaccine = Companions.get_vaccine!(id)

    with {:ok, %Vaccine{} = vaccine} <- Companions.update_vaccine(vaccine, vaccine_params) do
      render(conn, "show.json", vaccine: vaccine)
    end
  end

  def delete(conn, %{"id" => id}) do
    vaccine = Companions.get_vaccine!(id)

    with {:ok, %Vaccine{}} <- Companions.delete_vaccine(vaccine) do
      send_resp(conn, :no_content, "")
    end
  end
end
