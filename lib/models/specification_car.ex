defmodule Rent.Models.SpecificationCar do
  use Ecto.Schema

  alias Rent.Models.{Car, Specification}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:car_id, :specification_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "specifications_cars" do
    belongs_to :car, Car
    belongs_to :specification, Specification

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
