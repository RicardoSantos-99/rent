defmodule RentWeb.CategoriesView do
  use RentWeb, :view

  alias Rent.Category

  def render("create.json", %{category: %Category{} = category}) do
    %{
      message: "Item created!",
      category: category
    }
  end
end
