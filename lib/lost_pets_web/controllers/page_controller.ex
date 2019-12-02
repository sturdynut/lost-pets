defmodule LostPetsWeb.PageController do
  use LostPetsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
