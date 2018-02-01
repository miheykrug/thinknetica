puts "Возможные типы поездов: freight - грузовые; passenger - пассажирские"

class Station

  attr_reader :station_name, :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def take_train(train)
    @trains << train
    puts "Поезд № #{train.number} прибыл на станцию #{station_name}"
  end

  def get_types_of_trains(type)
    trains.each { |train| train.type == type }
  end

  def train_departure(train)
    if trains.include?(train)
      trains.delete(train)
      puts "Поезд № #{train.number} отправился со станции #{station_name}"
    else
      puts "Такого поезда нет на станции #{station_name}"
    end
  end

end

class Route

  attr_accessor :stations

  def initialize(first_station, end_station)
    @stations = [] << first_station << end_station
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    if station == stations.first || station == stations.last
      puts "Можно удалять только промежуточные станции"
    else
      stations.delete(station)
    end
  end

  def list_stations
    puts "На данном маршруте следующие остановки:"
    stations.each { |station| puts station.station_name }
  end

end

class Train

  attr_reader :number, :type, :wagons, :route, :speed

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end


  def increase_speed(value)
    self.speed += value
  end

  def reduse_speed(value)
    self.speed -= value
    self.speed = 0 if self.speed < 0
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    if speed == 0
      self.wagons += 1
    else
      puts "Нельзя прицепить вагон во время движения поезда"
    end
  end

  def remove_wagon
    if speed == 0
      if wagons == 0
        puts "Невозможно отцепить вагон, т.к. вагонов не осталось"
      else
        self.wagons -= 1
      end
    else
      puts "Нельзя отцепить вагон во время движения поезда"
    end
  end


  def add_route(route)
    @@i = 0
    self.route = route
    route.stations[@@i].take_train(self)
  end

  def to_next_station
    route.stations[@@i].train_departure(self)
    @@i += 1
    route.stations[@@i].take_train(self)
  end

  def to_previous_station
    route.stations[@@i].train_departure(self)
    @@i -= 1
    route.stations[@@i].take_train(self)
  end

  def previous_station
    route.stations[@@i - 1]
  end

  def current_station
    route.stations[@@i]
  end

  def next_station
    route.stations[@@i + 1]
  end

  private
    attr_writer :wagons, :route, :speed
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
station1.trains
station1.get_types_of_trains("freight")
station1.train_departure(train1)
station1.train_departure(train1)
station1.trains
station1.get_types_of_trains("passenger")

puts "--------------"

route1.add_station(station3)
route1.add_station(station4)
route1.list_stations
route1.remove_station(station4)
route1.remove_station(station1)
route1.list_stations
route1.add_station(station4)

puts "--------------"
train3 = Train.new(3, "passenger", 10)
train4 = Train.new(4, "passenger", 0)

train3.add_wagon
train3.stop
train3.add_wagon
puts train3.wagons
train3.remove_wagon
train4.remove_wagon
puts train3.wagons

train3.add_route(route1)
puts train3.route.list_stations
puts train3.current_station.station_name
train3.current_station.trains
train3.to_next_station
puts train3.current_station.station_name
train3.current_station.trains
train3.to_next_station
puts train3.current_station.station_name
train3.current_station.trains
train3.to_previous_station
puts train3.current_station.station_name
train3.current_station.trains

train3.increase_speed(50)
puts train3.speed
train3.reduse_speed(20)
puts train3.speed
train3.reduse_speed(50)
puts train3.speed
