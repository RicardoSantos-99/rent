defmodule Rent.Rentals.Create do
  alias Rent.{Error, Repo}
  alias Rent.Models.Rents

  def call(params) do
    params
    |> Rents.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Rents{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
