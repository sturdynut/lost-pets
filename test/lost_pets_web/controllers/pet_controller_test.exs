defmodule LostPetsWeb.PetControllerTest do
  use LostPetsWeb.ConnCase

  alias LostPets.Missing

  @create_attrs %{age: "some age", color: "some color", email: "some email", last_seen_address: "some last_seen_address", last_seen_city: "some last_seen_city", last_seen_country: "some last_seen_country", last_seen_postal_code: "some last_seen_postal_code", last_seen_state: "some last_seen_state", microchip: "some microchip", name: "some name", owner_name: "some owner_name", phone: "some phone", size: "some size", species: "some species"}
  @update_attrs %{age: "some updated age", color: "some updated color", email: "some updated email", last_seen_address: "some updated last_seen_address", last_seen_city: "some updated last_seen_city", last_seen_country: "some updated last_seen_country", last_seen_postal_code: "some updated last_seen_postal_code", last_seen_state: "some updated last_seen_state", microchip: "some updated microchip", name: "some updated name", owner_name: "some updated owner_name", phone: "some updated phone", size: "some updated size", species: "some updated species"}
  @invalid_attrs %{age: nil, color: nil, email: nil, last_seen_address: nil, last_seen_city: nil, last_seen_country: nil, last_seen_postal_code: nil, last_seen_state: nil, microchip: nil, name: nil, owner_name: nil, phone: nil, size: nil, species: nil}

  def fixture(:pet) do
    {:ok, pet} = Missing.create_pet(@create_attrs)
    pet
  end

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pets"
    end
  end

  describe "new pet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pet"
    end
  end

  describe "create pet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pet_path(conn, :show, id)

      conn = get(conn, Routes.pet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pet"
    end
  end

  describe "edit pet" do
    setup [:create_pet]

    test "renders form for editing chosen pet", %{conn: conn, pet: pet} do
      conn = get(conn, Routes.pet_path(conn, :edit, pet))
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "redirects when data is valid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @update_attrs)
      assert redirected_to(conn) == Routes.pet_path(conn, :show, pet)

      conn = get(conn, Routes.pet_path(conn, :show, pet))
      assert html_response(conn, 200) =~ "some updated age"
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, Routes.pet_path(conn, :delete, pet))
      assert redirected_to(conn) == Routes.pet_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pet_path(conn, :show, pet))
      end
    end
  end

  defp create_pet(_) do
    pet = fixture(:pet)
    {:ok, pet: pet}
  end
end
