defmodule Rent.Categories.Create do
  alias Rent.{Error, Repo}
  alias Rent.Models.Category

  def call(params) do
    params
    |> Category.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Category{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
