defmodule RentWeb.Schema.Types.Specification do
  use Absinthe.Schema.Notation

  object :specification do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :description, non_null(:string)
  end

  input_object :create_specification_input do
    field :name, non_null(:string)
    field :description, non_null(:string)
  end
end
