require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'

station1 = Station.new("Minsk")
station2 = Station.new("Moskow")
station3 = Station.new("Volozhin")
station4 = Station.new("Smolensk")

route1 = Route.new(station1, station2)

train1 = CargoTrain.new(1)
train2 = PassengerTrain.new(2)

wagon1 = CargoWagon.new
wagon2 = CargoWagon.new
wagon3 = PassengerWagon.new
wagon4 = PassengerWagon.new


puts "-------Проверка станции-----"
puts
station1.take_train(train1)
station1.take_train(train1)
station1.take_train(train1)
station1.take_train(train2)
puts station1.trains.to_s
puts station1.get_trains(CargoTrain).to_s
puts station1.get_trains(PassengerTrain).to_s
station1.train_departure(train1)
station1.train_departure(train1)
puts station1.trains.to_s

puts
puts "------Проверка маршрута--------"
puts

route1.add_station(station3)
route1.add_station(station4)
route1.list_stations
route1.remove_station(station4)
route1.remove_station(station1)
route1.list_stations
route1.add_station(station4)

puts
puts "------Добавление вагонов (груз. поезд)-----"
puts

train1.add_wagon(wagon1)
train1.add_wagon(wagon1)
train1.add_wagon(wagon2)
train1.add_wagon(wagon3)
train1.add_wagon(wagon4)
puts train1.wagons.to_s
train1.remove_wagon(wagon2)
puts train1.wagons.to_s

puts
puts "------Добавление вагонов (пасс. поезд)-----"
puts

train2.add_wagon(wagon1)
train2.add_wagon(wagon2)
train2.add_wagon(wagon3)
train2.add_wagon(wagon3)
train2.add_wagon(wagon4)
puts train2.wagons.to_s
train2.remove_wagon(wagon4)
puts train2.wagons.to_s

puts
puts "-------Движение по маршруту-------"
puts
train1.add_route(route1)
train1.route.list_stations
puts train1.current_station.name
train1.current_station.trains
train1.to_next_station
puts train1.current_station.name
train1.current_station.trains
train1.to_next_station
puts train1.current_station.name
train1.current_station.trains
train1.to_next_station
puts train1.current_station.name
train1.current_station.trains
train1.to_next_station
puts train1.current_station.name
train1.current_station.trains
train1.to_previous_station
puts train1.current_station.name
train1.current_station.trains
train1.to_previous_station
puts train1.current_station.name
train1.current_station.trains
train1.to_previous_station
puts train1.current_station.name
train1.current_station.trains
train1.to_previous_station
puts train1.current_station.name
train1.current_station.trains

puts
puts "-----Изменение скорости---------"
puts
train1.increase_speed(50)
puts train1.speed
train1.reduse_speed(20)
puts train1.speed
train1.reduse_speed(50)
puts train1.speed
