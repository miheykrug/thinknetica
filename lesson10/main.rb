require_relative 'acessors'
require_relative 'validation'
require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'trains_menu'
require_relative 'routes_menu'
require_relative 'stations_menu'
require_relative 'wagons_menu'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'

menu = Menu.new
menu.run

# s1 = Station.new("SSSS")
# s2 = Station.new("DDDD")
# s3 = Station.new("FFFF")

# r1 = Route
# t = CargoTrain.new("qwwqw")
# puts t.is_a? Train
# Убрать коментирование для проверки методов задания 10
# class Test
#   include Validation
#   include Acessors
#   attr_accessor_with_history :name
#   strong_attr_acessor :test, String
#   validate :name, :presence, true
#   validate :name, :type, String
#   validate :name, :format, /[A-Z]/

# end

# puts t = Test.new
# puts Test.instance_variables
# puts Test.attr_validations

# puts t.valid?

# t.name = "A"
# puts t.valid?
# puts t.validate!

# t.name = "B"
# puts t.name_history.to_s
# t.name = "C"
# puts t.name_history.to_s
# t.test = "a"
# t.test = ['ad']
