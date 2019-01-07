# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gist,
  ecto_repos: [Gist.Repo]

# Configures the endpoint
config :gist, Gist.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h6DnOoLHgQgICXaq4Fwh1EZOjq2zppN6Vh+m/70t/WnEe19904Y3aOGmoKxp4nsb",
  render_errors: [view: Gist.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gist.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Gist",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Gist.GuardianSerializer,
  secret_key: "syR5soTnDOp25yxyU4Y4rL/r0j4v/MNy/5l2gnjRcMwCx/UlWO88C28lWI0UrgJP"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
