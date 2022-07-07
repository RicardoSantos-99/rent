defmodule Rent.Categories.Index do
  alias Rent.Models.Category
  alias Rent.Repo

  def call do
    {:ok, Repo.all(Category)}
  end
end
