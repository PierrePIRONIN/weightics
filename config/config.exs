# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weightics_backend,
  ecto_repos: [WeighticsBackend.Repo]

# Configures the endpoint
config :weightics_backend, WeighticsBackend.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6q4BRLP22/6PmkZz9yWHFvepU+OgDCYsN25wD1pAs6p6IMsGoGUgjekz8Kuzd8ZA",
  render_errors: [view: WeighticsBackend.ErrorView, accepts: ~w(json)],
  pubsub: [name: WeighticsBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
