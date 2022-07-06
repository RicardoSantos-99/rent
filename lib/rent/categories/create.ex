defmodule Rent.Categories.Create do
  alias Rent.{Category, Error, Repo}

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
