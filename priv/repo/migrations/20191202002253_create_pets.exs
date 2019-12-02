defmodule LostPets.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :microchip, :string
      add :name, :string
      add :owner_name, :string
      add :phone, :string
      add :email, :string
      add :last_seen_address, :string
      add :last_seen_city, :string
      add :last_seen_country, :string
      add :last_seen_state, :string
      add :last_seen_postal_code, :string
      add :species, :string
      add :age, :string
      add :color, :string
      add :size, :string

      timestamps()
    end

  end
end
