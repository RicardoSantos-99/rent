defmodule RentWeb.Resolvers.Category do
  alias Rent.Categories

  def create(%{input: params}, _context), do: Categories.Create.call(params)
  def delete(%{id: id}, _context), do: Categories.Delete.call(id)
  def index(_params, _context), do: Categories.Index.call()
end
