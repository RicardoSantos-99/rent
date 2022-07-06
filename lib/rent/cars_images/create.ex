defmodule Rent.CarsImages.Create do
  alias Rent.{CarsImages, Error, Repo}

  def call(params) do
    params
    |> CarsImages.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %CarsImages{} = result}), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
