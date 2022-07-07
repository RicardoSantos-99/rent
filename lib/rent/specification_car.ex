defmodule Rent.SpecificationCar do
  use Ecto.Schema

  alias Rent.{Car}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:car_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "specifications_cars" do
    belongs_to :car, Car

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
