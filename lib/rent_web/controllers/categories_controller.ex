defmodule RentWeb.CategoriesController do
  use RentWeb, :controller

  alias Rent.Category
  alias RentWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Category{} = category} <- Rent.Categories.Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", category: category)
    end
  end
end
