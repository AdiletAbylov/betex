# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :betex,
  ecto_repos: [Betex.Repo]

# Configures the endpoint
config :betex, BetexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2Ja9WyVfIv9WVtRvvrwSMcUn1JhAdr976EViXYTFlr0EJ6v4ogVkKC2fvJbrb5c7",
  render_errors: [view: BetexWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Betex.PubSub,
  live_view: [signing_salt: "eLsBQLg9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :betex,
  hosts: [localhost: 9092],
  topics: ["sport-events-topic"],
  consumer_group: "sport-events-group"

# config :kaffe,
#   consumer: [
#     endpoints: [kafka: 9092],
#     topics: ["sport-events-topic"],
#     consumer_group: "sport-events-group",
#     message_handler: Betex.Kaffe.MessagesProcessor,
#     offset_reset_policy: :reset_to_latest,
#     max_bytes: 500_000,
#     worker_allocation_strategy: :worker_per_topic_partition
#   ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
