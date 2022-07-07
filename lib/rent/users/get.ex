defmodule Rent.Users.Get do
  alias Rent.{Error, Repo}
  alias Rent.Models.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
