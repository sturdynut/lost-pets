defmodule LostPetsWeb.HelloController do
  use LostPetsWeb, :controller

  def message(conn, %{"data" => data}) do
    render(conn, "hello.html", data: data)
  end
end
