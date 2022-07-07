defmodule Rent.Specifications.Delete do
  alias Rent.{Error, Repo}
  alias Rent.Models.Specification

  def call(id) do
    case Repo.get(Specification, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      specification -> Repo.delete(specification)
    end
  end
end
