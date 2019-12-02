defmodule LostPetsWeb.PetController do
  use LostPetsWeb, :controller

  alias LostPets.Missing
  alias LostPets.Missing.Pet

  def index(conn, _params) do
    pets = Missing.list_pets()
    render(conn, "index.html", pets: pets)
  end

  def new(conn, _params) do
    changeset = Missing.change_pet(%Pet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pet" => pet_params}) do
    case Missing.create_pet(pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet created successfully.")
        |> redirect(to: Routes.pet_path(conn, :show, pet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Missing.get_pet!(id)
    render(conn, "show.html", pet: pet)
  end

  def edit(conn, %{"id" => id}) do
    pet = Missing.get_pet!(id)
    changeset = Missing.change_pet(pet)
    render(conn, "edit.html", pet: pet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Missing.get_pet!(id)

    case Missing.update_pet(pet, pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet updated successfully.")
        |> redirect(to: Routes.pet_path(conn, :show, pet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pet: pet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Missing.get_pet!(id)
    {:ok, _pet} = Missing.delete_pet(pet)

    conn
    |> put_flash(:info, "Pet deleted successfully.")
    |> redirect(to: Routes.pet_path(conn, :index))
  end
end
