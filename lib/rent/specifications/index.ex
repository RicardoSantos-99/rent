defmodule Rent.Specifications.Index do
  alias Rent.{Error, Repo}
  alias Rent.Models.Specification

  def call() do
    {:ok, Repo.all(Specification)}
  end
end
