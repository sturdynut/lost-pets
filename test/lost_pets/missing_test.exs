defmodule LostPets.MissingTest do
  use LostPets.DataCase

  alias LostPets.Missing

  describe "pets" do
    alias LostPets.Missing.Pet

    @valid_attrs %{age: "some age", color: "some color", email: "some email", last_seen_address: "some last_seen_address", last_seen_city: "some last_seen_city", last_seen_country: "some last_seen_country", last_seen_postal_code: "some last_seen_postal_code", last_seen_state: "some last_seen_state", microchip: "some microchip", name: "some name", owner_name: "some owner_name", phone: "some phone", size: "some size", species: "some species"}
    @update_attrs %{age: "some updated age", color: "some updated color", email: "some updated email", last_seen_address: "some updated last_seen_address", last_seen_city: "some updated last_seen_city", last_seen_country: "some updated last_seen_country", last_seen_postal_code: "some updated last_seen_postal_code", last_seen_state: "some updated last_seen_state", microchip: "some updated microchip", name: "some updated name", owner_name: "some updated owner_name", phone: "some updated phone", size: "some updated size", species: "some updated species"}
    @invalid_attrs %{age: nil, color: nil, email: nil, last_seen_address: nil, last_seen_city: nil, last_seen_country: nil, last_seen_postal_code: nil, last_seen_state: nil, microchip: nil, name: nil, owner_name: nil, phone: nil, size: nil, species: nil}

    def pet_fixture(attrs \\ %{}) do
      {:ok, pet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Missing.create_pet()

      pet
    end

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Missing.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Missing.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      assert {:ok, %Pet{} = pet} = Missing.create_pet(@valid_attrs)
      assert pet.age == "some age"
      assert pet.color == "some color"
      assert pet.email == "some email"
      assert pet.last_seen_address == "some last_seen_address"
      assert pet.last_seen_city == "some last_seen_city"
      assert pet.last_seen_country == "some last_seen_country"
      assert pet.last_seen_postal_code == "some last_seen_postal_code"
      assert pet.last_seen_state == "some last_seen_state"
      assert pet.microchip == "some microchip"
      assert pet.name == "some name"
      assert pet.owner_name == "some owner_name"
      assert pet.phone == "some phone"
      assert pet.size == "some size"
      assert pet.species == "some species"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Missing.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{} = pet} = Missing.update_pet(pet, @update_attrs)
      assert pet.age == "some updated age"
      assert pet.color == "some updated color"
      assert pet.email == "some updated email"
      assert pet.last_seen_address == "some updated last_seen_address"
      assert pet.last_seen_city == "some updated last_seen_city"
      assert pet.last_seen_country == "some updated last_seen_country"
      assert pet.last_seen_postal_code == "some updated last_seen_postal_code"
      assert pet.last_seen_state == "some updated last_seen_state"
      assert pet.microchip == "some updated microchip"
      assert pet.name == "some updated name"
      assert pet.owner_name == "some updated owner_name"
      assert pet.phone == "some updated phone"
      assert pet.size == "some updated size"
      assert pet.species == "some updated species"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Missing.update_pet(pet, @invalid_attrs)
      assert pet == Missing.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Missing.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Missing.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Missing.change_pet(pet)
    end
  end
end
