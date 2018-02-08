class Route
  attr_accessor :stations

  def initialize(first_station, end_station)
    @stations = [first_station, end_station]
  end

  def add_station(station)
    if stations.include?(station)
      puts "Станция #{station.name} уже есть в маршруте"
    else
      stations.insert(-2, station)
    end
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
    stations.each { |station| puts station.name }
  end
end
