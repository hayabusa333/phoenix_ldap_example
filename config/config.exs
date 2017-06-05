# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_ldap_example,
  ecto_repos: [PhoenixLdapExample.Repo]

# Configures the endpoint
config :phoenix_ldap_example, PhoenixLdapExample.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "80qJAQrJ9sAegEAxDmRBvRMCENQvk9FU9xbuky2+PuG3/MsGMfyioyNxoycA+KIq",
  render_errors: [view: PhoenixLdapExample.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLdapExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "LdapExample",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "NotSoSecretButWorksForADemo",
  serializer: LdapExample.GuardianSerializer
