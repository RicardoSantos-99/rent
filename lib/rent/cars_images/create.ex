defmodule Rent.CarsImages.Create do
  alias Rent.{CarsImage, Error, Repo}

  def call(params) do
    params
    |> CarsImage.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %CarsImage{} = result}), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
