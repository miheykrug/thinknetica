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




menu = Menu.new
menu.run
# s3 = Station.new("Volozhin")
# s4 = Station.new("Smolensk")

# ct1 = CargoTrain.new("qew-12")
# pt1 = PassengerTrain.new("qqw-11")

# s1 = Station.new("Minsk")
# s2 = Station.new("Moskow")

# r1 = Route.new(s1, s2)

# cw1 = CargoWagon.new(100)
# cw2 = CargoWagon.new(110)
# cw3 = CargoWagon.new(120)
# pw1 = PassengerWagon.new(8)
# pw2 = PassengerWagon.new(10)
# pw3 = PassengerWagon.new(12)

# cw1.occupy_space(90)
# puts cw1.free_space
# puts cw1.occupied_space
# cw1.occupy_space(20)

# pw1.occupy_space
# puts pw1.free_space
# puts pw1.occupied_space

# ct1.add_wagon(cw1)
# ct1.add_wagon(cw2)
# ct1.add_wagon(cw3)
# ct1.add_wagon(pw1)

# pt1.add_wagon(pw1)
# pt1.add_wagon(pw2)
# pt1.add_wagon(pw3)

# ct1.each_wagon { |t| puts t }
# pt1.each_wagon { |t| puts t }

# puts cw1.number
# puts cw2.number
# puts cw3.number
# puts pw1.number
# puts pw2.number
# puts pw3.number

# w1 = Wagon.new
# puts w1.number
