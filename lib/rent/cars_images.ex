defmodule Rent.CarsImages do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rent.Car

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:image_name]

  schema "cars_images" do
    field :image_name, :string

    belongs_to :car, Car

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
