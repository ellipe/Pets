defmodule PetsWeb.AuthController do
  use PetsWeb, :controller
  plug Ueberauth

  action_fallback PetsWeb.FallbackController

  def request(conn, params) do
    IO.inspect(conn.assigns)
    IO.inspect(params)
  end

  def callback(conn, params) do
    IO.inspect(conn.assigns)
    IO.inspect(params)
  end
end
