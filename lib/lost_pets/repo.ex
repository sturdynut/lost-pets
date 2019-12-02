defmodule LostPets.Repo do
  use Ecto.Repo,
    otp_app: :lost_pets,
    adapter: Ecto.Adapters.Postgres
end
