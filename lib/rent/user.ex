defmodule Rent.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rent.Rents
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :name, :admin, :cpf, :driver_license, :avatar, :password]

  @derive {Jason.Encoder, only: [:id, :email, :name, :admin, :cpf, :driver_license, :avatar]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :driver_license, :string
    field :admin, :boolean
    field :avatar, :string

    has_many :rentals, Rents

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 8)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
