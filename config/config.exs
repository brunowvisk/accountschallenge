# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :backend,
  ecto_repos: [Backend.Repo]

config :backend,
       Backend.Users.Create,
       via_cep_adapter: Backend.ViaCep.Client

# Configures UUID
config :backend, Backend.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :backend, BackendWeb.Auth.Pipeline,
  module: BackendWeb.Auth.Guardian,
  error_handler: BackendWeb.Auth.ErrorHandler

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mYiLYAcy23EjbGfOxWJvH4NDTM5G8BKyIcRKdT19DDNIJMEVvX8Fx1IQ1wxEWG3p",
  render_errors: [view: BackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Backend.PubSub,
  live_view: [signing_salt: "ycgsQ81y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
