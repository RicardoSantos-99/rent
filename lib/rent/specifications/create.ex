defmodule Rent.Specifications.Create do
  alias Rent.{Error, Repo}
  alias Rent.Models.Specification

  def call(params) do
    params
    |> Specification.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Specification{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
