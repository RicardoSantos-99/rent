defmodule RentWeb.Schema.Types.Category do
  use Absinthe.Schema.Notation

  object :category do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :description, non_null(:string)
  end

  input_object :create_category_input do
    field :name, non_null(:string)
    field :description, non_null(:string)
  end
end
