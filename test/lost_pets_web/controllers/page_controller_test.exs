defmodule LostPetsWeb.PageControllerTest do
  use LostPetsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Lost Pets"
  end
end
