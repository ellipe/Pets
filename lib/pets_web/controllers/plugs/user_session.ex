defmodule PetsWeb.Plugs.UserSession do
  import Plug.Conn
  import Phoenix.Controller

  alias Pets.Accounts
  alias Pets.Accounts.User

  def init(_params) do
  end

  def call(conn, _params) do
    # _params is whatever is returned from the init function.
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Accounts.get_user!(user_id) ->
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end
end
