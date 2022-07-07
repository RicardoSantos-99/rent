defmodule Rent.Categories.Index do
  alias Rent.{Error, Repo}
  alias Rent.Models.Category

  def call() do
    {:ok, Repo.all(Category)}
  end
end
