defmodule RentWeb.Resolvers.Specification do
  alias Rent.Specifications

  def create(%{input: params}, _context), do: Specifications.Create.call(params)
  def delete(%{id: id}, _context), do: Specifications.Delete.call(id)
  def index(_params, _context), do: Specifications.Index.call()
end
