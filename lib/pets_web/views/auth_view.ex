defmodule PetsWeb.AuthView do
  use PetsWeb, :view

  def render("show.json", %{auth: auth}) do
    %{data: render_one(auth, PetsWeb.AuthView, "auth.json")}
  end

  def render("auth.json", %{auth: auth}) do
    %{
      id: auth.id,
      email: auth.email
    }
  end
end
