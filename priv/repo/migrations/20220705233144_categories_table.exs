defmodule Rent.Repo.Migrations.CategoriesTable do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:categories, [:name])
  end
end
