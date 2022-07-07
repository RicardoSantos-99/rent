defmodule Rent.Rents do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rent.{User, Car}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [
    :user_id,
    :car_id,
    :start_date,
    :end_date,
    :expected_return_date,
    :total
  ]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "rentals" do
    field :start_date, :date
    field :end_date, :date
    field :expected_return_date, :date
    field :total, :decimal

    belongs_to :user, User
    belongs_to :car, Car

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
