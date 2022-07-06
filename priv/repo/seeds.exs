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

usv = %{name: "suv", description: "veículo utilitário esportivo"}
hatch = %{name: "hatch", description: "carro compacto"}
sedan = %{name: "sedan", description: "porta malas grande"}
picape = %{name: "picape", description: "carro com caçamba"}

Rent.Categories.Create.call(usv)
Rent.Categories.Create.call(hatch)
Rent.Categories.Create.call(sedan)
%{id: id} = Rent.Categories.Create.call(picape)

car = %{
  name: "Uno",
  description: "the economic car",
  daily_rate: Decimal.new("5.00"),
  available: true,
  license_plate: "xpt-5503",
  brand: "Fiat",
  category_id: id
}

%{id: car_id} = Rent.Cars.Create.call(car)

car_image = %{
  image_name: "uno.jpg",
  car_id: car_id
}

Rent.CarsImages.Create.call(car_image)
