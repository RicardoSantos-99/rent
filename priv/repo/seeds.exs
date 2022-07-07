# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rent.Repo.insert!(%Rent.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rent.{Category, Car, User, Specification}

usv = %{name: "suv", description: "veículo utilitário esportivo"}
hatch = %{name: "hatch", description: "carro compacto"}
sedan = %{name: "sedan", description: "porta malas grande"}
picape = %{name: "picape", description: "carro com caçamba"}

Rent.Categories.Create.call(usv)
Rent.Categories.Create.call(hatch)
Rent.Categories.Create.call(sedan)

{:ok, %Category{id: id}} = Rent.Categories.Create.call(picape)

car = %{
  name: "Uno",
  description: "the economic car",
  daily_rate: Decimal.new("5.00"),
  available: true,
  license_plate: "xpt-5503",
  brand: "Fiat",
  category_id: id
}

{:ok, %Car{id: car_id}} = Rent.Cars.Create.call(car)

car_image = %{image_name: "uno.jpg", car_id: car_id}
Rent.CarsImages.Create.call(car_image)

# %{password_hash: hash} = Pbkdf2.add_hash("123123")

user = %{
  name: "john doe",
  email: "john@example.com",
  cpf: "12345678901",
  password: "123123123",
  driver_license: "123456789",
  admin: true,
  avatar: "avatar.jpg"
}

{:ok, %User{id: user_id}} = Rent.Users.Create.call(user)

rent = %{
  user_id: user_id,
  car_id: car_id,
  start_date: ~D[2019-02-02],
  end_date: ~D[2019-02-02],
  expected_return_date: ~D[2019-02-02],
  total: Decimal.new("100.00")
}

Rent.Rentals.Create.call(rent)

specification = %{
  name: "manual",
  description: "Manual driver license"
}

{:ok, %Specification{id: specification_id}} = Rent.Specifications.Create.call(specification)

specification_cars = %{
  car_id: "a2f51b83-d316-4737-9bad-bda6396edb5b",
  specification_id: "ab5b5bb7-424d-461a-b980-ca83227fa039"
}

Rent.SpecificationsCars.Create.call(specification_cars)
