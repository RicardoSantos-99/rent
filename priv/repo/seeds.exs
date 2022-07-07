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

alias Rent.Models.{Category, Car, User, Specification}

usv = %{name: "suv", description: "veículo utilitário esportivo"}
hatch = %{name: "hatch", description: "carro compacto"}
sedan = %{name: "sedan", description: "porta malas grande"}
picape = %{name: "picape", description: "carro com caçamba"}

Rent.Categories.Create.call(usv)
Rent.Categories.Create.call(picape)
{:ok, %Category{id: hatch_id}} = Rent.Categories.Create.call(hatch)
{:ok, %Category{id: sedan_id}} = Rent.Categories.Create.call(sedan)

uno = %{
  name: "Uno",
  description: "the economic car",
  daily_rate: Decimal.new("5.00"),
  available: true,
  license_plate: "xpt-5503",
  brand: "Fiat",
  category_id: hatch_id
}

gol = %{
  name: "Gol",
  description: "family car",
  daily_rate: Decimal.new("10.00"),
  available: true,
  license_plate: "zas-5542",
  brand: "Volkswagen",
  category_id: sedan_id
}

{:ok, %Car{id: uno_id}} = Rent.Cars.Create.call(uno)
{:ok, %Car{id: gol_id}} = Rent.Cars.Create.call(gol)

uno_image = %{image_name: "uno.jpg", car_id: uno_id}
gol_image = %{image_name: "gol.jpg", car_id: gol_id}
Rent.CarsImages.Create.call(uno_image)
Rent.CarsImages.Create.call(gol_image)

john = %{
  name: "john",
  email: "john@example.com",
  cpf: "12345678901",
  password: "123123123",
  driver_license: "123456789",
  admin: true,
  avatar: "avatar.jpg"
}

doe = %{
  name: "doe",
  email: "doe@example.com",
  cpf: "12345678909",
  password: "123123123",
  driver_license: "123321123321",
  admin: true,
  avatar: "avatar.jpg"
}

{:ok, %User{id: john_id}} = Rent.Users.Create.call(john)
{:ok, %User{id: doe_id}} = Rent.Users.Create.call(doe)

rent_uno = %{
  user_id: john_id,
  car_id: uno_id,
  start_date: ~D[2019-02-02],
  end_date: ~D[2019-02-02],
  expected_return_date: ~D[2019-02-02],
  total: Decimal.new("100.00")
}

rent_gol = %{
  user_id: doe_id,
  car_id: gol_id,
  start_date: ~D[2019-02-02],
  end_date: ~D[2019-02-02],
  expected_return_date: ~D[2019-02-02],
  total: Decimal.new("150.00")
}

Rent.Rentals.Create.call(rent_uno)
Rent.Rentals.Create.call(rent_gol)

specification_manual = %{name: "manual", description: "Manual car"}
specification_automatic = %{name: "Automatic", description: "Automatic car"}

{:ok, %Specification{id: specification_manual_id}} =
  Rent.Specifications.Create.call(specification_manual)

{:ok, %Specification{id: specification_automatic_id}} =
  Rent.Specifications.Create.call(specification_automatic)

specification_uno = %{car_id: uno_id, specification_id: specification_manual_id}
specification_gol = %{car_id: gol_id, specification_id: specification_automatic_id}

Rent.SpecificationsCars.Create.call(specification_uno)
Rent.SpecificationsCars.Create.call(specification_gol)
