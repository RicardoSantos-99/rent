defmodule Rent.Repo.Migrations.Rentals do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :user_id, references(:users, type: :binary_id)
      add :car_id, references(:cars, type: :binary_id)
      add :start_date, :date
      add :end_date, :date
      add :expected_return_date, :date
      add :total, :decimal

      timestamps()
    end
  end
end
