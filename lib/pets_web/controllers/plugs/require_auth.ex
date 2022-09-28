defmodule PetsWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _param) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> send_resp(:unauthorized, "")
      |> halt()
    end
  end
end
