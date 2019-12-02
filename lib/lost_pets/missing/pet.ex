defmodule LostPets.Missing.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :age, :string
    field :color, :string
    field :email, :string
    field :last_seen_address, :string
    field :last_seen_city, :string
    field :last_seen_country, :string
    field :last_seen_postal_code, :string
    field :last_seen_state, :string
    field :microchip, :string
    field :name, :string
    field :owner_name, :string
    field :phone, :string
    field :size, :string
    field :species, :string

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:microchip, :name, :owner_name, :phone, :email, :last_seen_address, :last_seen_city, :last_seen_country, :last_seen_state, :last_seen_postal_code, :species, :age, :color, :size])
    |> validate_required([:microchip, :name, :owner_name, :phone, :email, :last_seen_address, :last_seen_city, :last_seen_country, :last_seen_state, :last_seen_postal_code, :species, :age, :color, :size])
  end
end
