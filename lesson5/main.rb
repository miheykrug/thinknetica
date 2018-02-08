require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'

station1 = Station.new("Minsk")
station2 = Station.new("Moskow")
station3 = Station.new("Volozhin")
station4 = Station.new("Smolensk")

route1 = Route.new(station1, station2)

train1 = CargoTrain.new(1)
train2 = PassengerTrain.new(2)

menu = Menu.new

menu.all_stations = [station1, station2, station3, station4]
menu.all_trains = [train1, train2]
menu.all_routes = [route1]

menu.run
