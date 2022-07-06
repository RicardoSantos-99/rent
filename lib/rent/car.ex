defmodule Rent.Car do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rent.{Category, CarsImages}

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

  schema "cars" do
    field :name, :string
    field :description, :string
    field :daily_rate, :decimal
    field :available, :boolean
    field :license_plate, :string
    field :brand, :string

    belongs_to :category, Category
    has_many :images, CarsImages

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
