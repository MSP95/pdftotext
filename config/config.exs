# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pdftotext,
  ecto_repos: [Pdftotext.Repo]

# Configures the endpoint
config :pdftotext, PdftotextWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ytc7GkEY1ShAmo4pUNWgfjY/RRU98OubThAYFlI/oknwR46/NMxPYg4OsTvhq+qA",
  render_errors: [view: PdftotextWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pdftotext.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
