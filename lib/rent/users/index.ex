defmodule Rent.Users.Index do
  alias Rent.{Error, Repo}
  alias Rent.Models.User

  def call() do
    {:ok, Repo.all(User)}
  end
end
