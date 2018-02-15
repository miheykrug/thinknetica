class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :number, :wagons, :route, :speed, :type

  class << self
    attr_accessor :all

    def find(number)
      all[number]
    end
  end

  NUMBER_FORMAT = /^[\da-z]{3}-?[\da-z]{2}$/i

  def initialize(number)
    @number = number
    @wagons = {}
    @speed = 0
    validate!
    register_instance
    add_to_all
  end

  def to_s
    "Поезд № #{number}, тип: #{type}, кол-во вагонов: #{wagons.length}"
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def each_wagon
    wagons.each { |number, wagon| yield(number, wagon) }
  end

  def increase_speed(value)
    self.speed += value
  end

  def reduse_speed(value)
    self.speed -= value
    self.speed = 0 if speed < 0
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    if speed != 0
      puts 'Нельзя прицепить вагон во время движения поезда'
    elsif wagons.key?(wagon.number)
      puts 'Этот вагон уже прицеплен'
    else
      wagons[wagon.number] = wagon
    end
  end

  def remove_wagon(wagon)
    if speed != 0
      puts 'Нельзя отцепить вагон во время движения поезда'
    elsif wagons.empty?
      puts 'Не осталось вагонов'
    else
      wagons.delete(wagon.number) unless wagon.nil?
    end
  end

  def add_route(route)
    @current_station_index = 0
    self.route = route
    current_station.take_train(self)
  end

  def to_next_station
    if @current_station_index < (route.stations.length - 1)
      current_station.train_departure(self)
      @current_station_index += 1
      current_station.take_train(self)
    else
      puts 'Это конечная станция. Поезд дальше не идет'
    end
  end

  def to_previous_station
    if @current_station_index.zero?
      puts 'Это начальная станция. Возвращаться некуда!'
    else
      current_station.train_departure(self)
      @current_station_index -= 1
      current_station.take_train(self)
    end
  end

  def previous_station
    route.stations[@current_station_index - 1]
  end

  def current_station
    route.stations[@current_station_index]
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  protected

  attr_writer :route, :speed

  def add_to_all
    self.class.all ||= {}
    self.class.all[number] = self
  end

  def validate!
    raise "Number can't be nil" if number.nil?
    raise 'Number should be at least 5 symbols' if number.length < 5
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
    true
  end
end
