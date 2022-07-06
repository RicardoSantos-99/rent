defmodule Rent.Repo.Migrations.CarsImagesTable do
  use Ecto.Migration

  def change do
    create table(:cars_image) do
      add :image_name, :string
      add :car_id, references(:cars, type: :binary_id)

      timestamps()
    end
  end
end
