defmodule Pets.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pets.Repo,
      # Start the Telemetry supervisor
      PetsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pets.PubSub},
      # Start the Endpoint (http/https)
      PetsWeb.Endpoint
      # Start a worker by calling: Pets.Worker.start_link(arg)
      # {Pets.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pets.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
