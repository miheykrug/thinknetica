require_relative 'manufacturer'
require_relative 'instance_counter'

require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'

# Проверка задания 6
# s1 = Station.new("csac")
# s2 = Station.new("dasd")
# s3 = Station.new("gth")

# puts Station.all.to_s
# puts Station.instances

# t1 = Train.new(121)
# t2 = Train.new(212)
# t3 = Train.new(343)

# puts Train.all.to_s
# puts Train.instances
# puts Train.find(212)
# puts Train.find(22321)
# t1.manufacturer = "Bill"
# puts t1.manufacturer

# w = Wagon.new
# w.manufacturer = "John"
# puts w.manufacturer

# r1 = Route.new(s1, s2)
# r2 = Route.new(s1, s3)
# puts Route.instances
