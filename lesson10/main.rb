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
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'

menu = Menu.new
menu.run

#Убрать коментирование для проверки методов задания 10
# class Test
#   include Validation
#   include Acessors
#   attr_accessor_with_history :name
#   strong_attr_acessor :test, String
#   validate :name, :presence
#   validate :name, :type, String
#   validate :name, :format, /[A-Z]/

# end

# puts t = Test.new
# puts t.valid?

# t.name = "A"
# puts t.valid?
# puts t.validate!

# t.name = "B"
# puts t.name_history.to_s

# t.test = "a"
# t.test = ['ad']
