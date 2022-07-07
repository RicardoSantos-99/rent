defmodule RentWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors
  alias RentWeb.Resolvers.User, as: UsersResolver
  alias RentWeb.Resolvers.Category, as: CategoriesResolver
  alias RentWeb.Resolvers.Specification, as: SpecificationsResolver
  alias RentWeb.Schema.Types

  import_types Types.User
  import_types Types.Category
  import_types Types.Specification
  import_types Types.Custom.UUID4

  object :root_query do
    field :user, type: :user do
      arg :id, non_null(:id)

      resolve &UsersResolver.get/2
    end

    field :users, list_of(:user) do
      resolve &UsersResolver.index/2
    end

    field :categories, list_of(:category) do
      resolve &CategoriesResolver.index/2
    end

    field :specifications, list_of(:specification) do
      resolve &SpecificationsResolver.index/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UsersResolver.create/2
      middleware TranslateErrors
    end

    field :delete_user, type: :user do
      arg :id, non_null(:id)

      resolve &UsersResolver.delete/2
      middleware TranslateErrors
    end


    field :create_category, type: :category do
      arg :input, non_null(:create_category_input)

      resolve &CategoriesResolver.create/2
      middleware TranslateErrors
    end

    field :delete_category, type: :category do
      arg :id, non_null(:id)

      resolve &CategoriesResolver.delete/2
      middleware TranslateErrors
    end


    field :create_specification, type: :specification do
      arg :input, non_null(:create_specification_input)

      resolve &SpecificationsResolver.create/2
      middleware TranslateErrors
    end

    field :delete_specification, type: :specification do
      arg :id, non_null(:id)

      resolve &SpecificationsResolver.delete/2
      middleware TranslateErrors
    end
  end
end
