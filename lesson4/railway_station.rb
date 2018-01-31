puts "Возможные типы поездов: freight - грузовые; passenger - пассажирские"

class Station

  attr_accessor :trains
  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def take_train(train)
    @trains << train
    puts "Поезд № #{train.number} прибыл на станцию #{self.station_name}"
  end
  def get_trains
    puts "Сейчас на станции следующие поезда:"
    self.trains.each { |train| puts "- поезд № #{train.number}, тип: #{train.type}, количесво вагонов: #{train.wagons}"}
  end

  def get_types_of_trains
    freight = 0
    passenger = 0
    self.trains.each { |train| train.type == "freight" ? freight += 1 : passenger += 1 }
    puts "На станции #{freight} грузовых и #{passenger} пассажирских поездов"
  end

  def train_departure(train)
    if self.trains.include?(train)
      self.trains.delete(train)
      puts "Поезд № #{train.number} отправился со станции #{self.station_name}"
    else
      puts "Такого поезда нет на станции #{self.station_name}"
    end

  end
end

class Route
  attr_reader :first_station, :end_station
  attr_accessor :stations

  def initialize(first_station, end_station)
    @stations = []
    @stations << first_station << end_station
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    self.stations.delete(station)
  end

  def get_stations
    puts "На данном маршруте следующие остановки:"
    self.stations.each { |station| puts station.station_name }
  end

end

class Train

  attr_reader :number, :type
  attr_accessor :wagons, :speed, :route, :current_station

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
  end

  def stop
    self.speed = 0
  end
  def add_wagon
    if self.speed == 0
      @wagons += 1
    else
      puts "Нельзя прицепить вагон во время движения поезда"
    end
  end

  def remove_wagon
    if self.speed == 0
      @wagons -= 1
    else
      puts "Нельзя отцепить вагон во время движения поезда"
    end
  end

  def add_route(route)
    self.route = route
    self.current_station = route.stations[0]
    self.current_station.take_train(self)
  end

  @@i = 0
  def to_next_station
    self.current_station.train_departure(self)
    @@i += 1
    self.current_station = self.route.stations[@@i]
    self.current_station.take_train(self)
  end
  def to_previous_station
    self.current_station.train_departure(self)
    @@i -= 1
    self.current_station = self.route.stations[@@i]
    self.current_station.take_train(self)
  end

  def get_current_station
    puts "Предыдущая станция: #{self.route.stations[@@i - 1].station_name}"
    puts "Текущая станция: #{self.current_station.station_name}"
    puts "Следующая станция: #{self.route.stations[@@i + 1].station_name}"
  end
end


#Check code

station1 = Station.new("Minsk")
station2 = Station.new("Moskow")
station3 = Station.new("Volozhin")
station4 = Station.new("Smolensk")

route1 = Route.new(station1, station2)

train1 = Train.new(1, "freight", 5)
train2 = Train.new(2, "passenger", 8)

station1.take_train(train1)
station1.take_train(train2)
station1.get_trains
station1.get_types_of_trains
station1.train_departure(train1)
station1.train_departure(train1)
station1.get_trains
station1.get_types_of_trains

puts "--------------"

route1.add_station(station3)
route1.add_station(station4)
route1.get_stations
route1.remove_station(station4)
route1.get_stations
route1.add_station(station4)

puts "--------------"
train3 = Train.new(3, "passenger", 10)

puts train3.speed = 30
train3.add_wagon
train3.stop
train3.add_wagon
puts train3.wagons
train3.remove_wagon
puts train3.wagons

train3.add_route(route1)
puts train3.route.get_stations
puts train3.current_station.station_name
train3.current_station.get_trains
train3.to_next_station
puts train3.current_station.station_name
train3.current_station.get_trains
train3.to_next_station
puts train3.current_station.station_name
train3.current_station.get_trains
train3.to_previous_station
puts train3.current_station.station_name
train3.current_station.get_trains
train3.get_current_station
