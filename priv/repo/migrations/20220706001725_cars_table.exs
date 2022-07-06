defmodule Rent.Repo.Migrations.CarsTable do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :name, :string
      add :description, :string
      add :daily_rate, :decimal
      add :available, :boolean
      add :license_plate, :string
      add :brand, :string
      add :category_id, references(:categories, type: :binary_id)

      timestamps()
    end
  end
end
