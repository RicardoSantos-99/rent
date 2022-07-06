defmodule Rent.Cars.Create do
  alias Rent.{Car, Error, Repo}

  def call(params) do
    params
    |> Car.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Car{} = result}), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
