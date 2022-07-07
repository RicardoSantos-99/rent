defmodule Rent.Users.Create do
  alias Rent.{Error, Repo}
  alias Rent.Models.User

  def call(params) do
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
