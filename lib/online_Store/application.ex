defmodule Online_Store.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Online_Store.Repo,
      # Start the Telemetry supervisor
      Online_StoreWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Online_Store.PubSub},
      # Start the Endpoint (http/https)
      Online_StoreWeb.Endpoint
      # Start a worker by calling: Online_Store.Worker.start_link(arg)
      # {Online_Store.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Online_Store.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Online_StoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
