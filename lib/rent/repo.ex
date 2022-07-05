defmodule Rent.Repo do
  use Ecto.Repo,
    otp_app: :rent,
    adapter: Ecto.Adapters.Postgres
end
