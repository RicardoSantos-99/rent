defmodule Rent.Categories.Delete do
  alias Rent.{Error, Repo}
  alias Rent.Models.Category

  def call(id) do
    case Repo.get(Category, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      category -> Repo.delete(category)
    end
  end
end
