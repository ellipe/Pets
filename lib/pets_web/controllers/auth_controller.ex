defmodule PetsWeb.AuthController do
  use PetsWeb, :controller

  alias Pets.Accounts.User
  alias Pets.Repo

  action_fallback PetsWeb.FallbackController

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> send_resp(200, "")
  end

  def signin(conn,  %{"user" => user_params}) do
    case insert_or_update_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id) # use a cookie later on.
        |> render("show.json", auth: user)

      {:error, reason} ->
        conn
        |> send_resp(400, reason)
    end
  end

  defp insert_or_update_user(%{"email" => email, "password" => password} = user_params) do
    case Repo.get_by(User, email: email) do
      nil ->
        User.changeset(%User{}, user_params) |> Repo.insert

      user ->
        user |> Comeonin.Bcrypt.check_pass(password, [hash_key: :password])
    end
  end
end
