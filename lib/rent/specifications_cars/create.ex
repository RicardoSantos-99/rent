defmodule Rent.SpecificationsCars.Create do
  alias Rent.{SpecificationCar, Error, Repo}

  def call(params) do
    params
    |> SpecificationCar.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %SpecificationCar{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
