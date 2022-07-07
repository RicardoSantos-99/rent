defmodule Rent.Models.Car do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rent.Models.{CarsImage, Category, Rents, SpecificationCar}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [
    :name,
    :description,
    :daily_rate,
    :available,
    :license_plate,
    :brand,
    :category_id
  ]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "cars" do
    field :name, :string
    field :description, :string
    field :daily_rate, :decimal
    field :available, :boolean
    field :license_plate, :string
    field :brand, :string

    belongs_to :category, Category
    belongs_to :rentals, Rents
    has_many :images, CarsImage
    has_many :specifications_car, SpecificationCar

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
