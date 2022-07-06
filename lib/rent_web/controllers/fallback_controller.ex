defmodule RentWeb.FallbackController do
  use RentWeb, :controller

  alias Rent.Error
  alias RentWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
