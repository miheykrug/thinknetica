class Train
  attr_reader :number, :wagons, :route, :speed

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
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
      puts "Нельзя прицепить вагон во время движения поезда"
    elsif wagons.include?(wagon)
      puts "Этот вагон уже прицеплен"
    else
      wagons << wagon
    end
  end

  def remove_wagon
    if speed != 0
      puts "Нельзя отцепить вагон во время движения поезда"
    elsif wagons.empty?
      puts "Не осталось вагонов"
    else
      wagons.pop
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
      puts "Это конечная станция. Поезд дальше не идет"
    end
  end

  def to_previous_station
    if @current_station_index == 0
      puts "Это начальная станция. Возвращаться некуда!"
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

    attr_writer :route, :speed #Эти сеттеры перенесены в protected т.к. используются только внутри других методов

end
