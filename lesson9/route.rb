class Route
  include InstanceCounter

  attr_accessor :stations

  def initialize(first_station, end_station)
    @stations = [first_station, end_station]
    validate!
    register_instance
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def to_s
    "#{stations.first.name} - #{stations.last.name}"
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
      puts 'Можно удалять только промежуточные станции'
    else
      stations.delete(station)
    end
  end

  def list_stations
    puts 'На данном маршруте следующие остановки:'
    stations.each { |station| puts station.name }
  end

  private

  def validate!
    raise "First and end stations can't be nil" if stations.any?(&:nil?)

    if stations.any? { |station| station.class != Station }
      raise 'First and end stations must be Station'
    end

    if stations.first == stations.last
      raise "First and end stations can't be equal"
    end

    true
  end
end
