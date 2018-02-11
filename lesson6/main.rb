require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'




# menu = Menu.new
# menu.run

# Проверка работоспособности кода к заданию 6
station3 = Station.new("Volozhin")
station4 = Station.new("Smolensk")

train1 = Train.new(1)
train2 = Train.new(2)

station1 = Station.new("Minsk")
station2 = Station.new("Moskow")
route1 = Route.new(station1, station2)
puts "------Train------"
puts Train.all
puts Train.instances
t = Train.find(1)
puts t.inspect
t.manufacturer = "fdsf"
puts t.manufacturer
t1 = Train.find(3)
puts t1 == nil

puts "------Station------"
puts Station.all
puts Station.instances

puts "------inheritance-------"
train3 = PassengerTrain.new(3)
train = PassengerTrain.new(4)
puts PassengerTrain.all
puts PassengerTrain.instances
t = PassengerTrain.find(4)
puts t.inspect
t.manufacturer = "fdsf"
puts t.manufacturer
t1 = PassengerTrain.find(6)
puts t1 == nil
