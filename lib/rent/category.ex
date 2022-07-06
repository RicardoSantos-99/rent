defmodule Rent.Category do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rent.Car

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :description]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "categories" do
    field :name, :string
    field :description, :string

    has_many :cars, Car

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
