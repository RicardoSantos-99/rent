defmodule RentWeb.CategoriesController do
  use RentWeb, :controller

  alias Rent.Categories.Create
  alias Rent.Models.Category
  alias RentWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Category{} = category} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", category: category)
    end
  end
end
