defmodule Rent.Users.Index do
  alias Rent.Models.User
  alias Rent.Repo

  def call do
    {:ok, Repo.all(User)}
  end
end
