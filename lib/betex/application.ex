defmodule Betex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Betex.Repo,
      # Start the Telemetry supervisor
      BetexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Betex.PubSub},
      # Start the Endpoint (http/https)
      BetexWeb.Endpoint,

      # Start Broadway
      Betex.Broadway.SportEvents,
      {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies), [name: Cluster.Supervisor]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Betex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BetexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
