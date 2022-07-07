defmodule Rent.Models.Specification do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rent.Models.SpecificationCar

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :description]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "specifications" do
    field :name, :string
    field :description, :string

    has_many :specification_car, SpecificationCar

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
