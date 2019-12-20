# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lost_pets,
  ecto_repos: [LostPets.Repo]

# Configures the endpoint
config :lost_pets, LostPetsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pXJODSf8H3zlfxilKls5QmAU4QsnkfAM11+6rS0HWHQKqqKXto3jyohUqf4k0VvG",
  render_errors: [view: LostPetsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LostPets.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Excludes for tests
if Mix.env() == :dev do
  config :mix_test_watch,
    clear: true
end
