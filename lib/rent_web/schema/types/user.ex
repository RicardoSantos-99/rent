defmodule RentWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :cpf, non_null(:string)
    field :driver_license, non_null(:string)
    field :admin, non_null(:boolean)
    field :avatar, non_null(:string)
  end

  input_object :create_user_input do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :cpf, non_null(:string)
    field :password, non_null(:string)
    field :driver_license, non_null(:string)
    field :admin, non_null(:boolean)
    field :avatar, non_null(:string)
  end
end
