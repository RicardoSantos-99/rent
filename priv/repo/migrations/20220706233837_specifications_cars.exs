defmodule Rent.Repo.Migrations.SpecificationsCars do
  use Ecto.Migration

  def change do
    create table(:specifications_cars) do
      add :specification_id, references(:specifications, type: :binary_id)
      add :car_id, references(:cars, type: :binary_id)

      timestamps()
    end
  end
end
