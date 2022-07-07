defmodule Rent.CarsImages.Create do
  alias Rent.{Error, Repo}
  alias Rent.Models.CarsImage

  def call(params) do
    params
    |> CarsImage.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %CarsImage{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
