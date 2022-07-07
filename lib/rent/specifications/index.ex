defmodule Rent.Specifications.Index do
  alias Rent.Models.Specification
  alias Rent.Repo

  def call do
    {:ok, Repo.all(Specification)}
  end
end
