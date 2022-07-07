defmodule Rent.Repo.Migrations.Specifications do
  use Ecto.Migration

  def change do
    create table(:specifications) do
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:specifications, [:name])
  end
end
