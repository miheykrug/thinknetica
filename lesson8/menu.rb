class Menu
  MAIN_MENU = ["Выберите действие:", "1 - Создать станцию", "2 - Создать поезд", "3 - Создать маршрут",
              "4 - Маршруты", "5 - Поезда", "6 - Список станций", "7 - Список поездов", "8 - Список маршрутов",
              "q - Выйти из программы"]
  ROUTES_MENU = ["Операции с маршрутами:", "1 - Добавить промежуточную станцию к маршруту",
                 "2 - Удалить промежуточную станцию из маршрута", "b - Вернуться назад"]
  TRAINS_MENU = ["Операции с поездами:", "1 - Назначить маршрут поезду", "2 - Добавить вагон к поезду",
                 "3 - Отцепить вагон от поезда", "4 - Переместить поезд на следующую станцию",
                 "5 - Переместить поезд на предыдущую станцию", "6 - Вагоны поезда",
                 "b - Вернуться назад"]

  def initialize
    @all_routes = []
  end

  def run
    seed_routes
    seed_stations
    seed_trains

    main_menu
  end

  private

  attr_accessor :all_routes, :current_route, :current_train

# Stations

  def seed_stations
    station3 = Station.new("Volozhin")
    station4 = Station.new("Smolensk")
  end

  def new_station
    puts "Ведите название станции"
    station = Station.new(gets.chomp)
    puts "Список станций"
    puts Station.all.to_s
  end

  def stations_list(stations)
    stations.each do |station|
      puts "#{stations.index(station) + 1} - #{station.name}"
      puts "Поезда на станции:"
      station.each_train { |train| puts "  Поезд № #{train.number}, тип: #{train.type}, кол-во вагонов: #{train.wagons.length}"}
    end
  end

# Trains

  def seed_trains
    train1 = CargoTrain.new("qew-12")
    train2 = PassengerTrain.new("qqw-11")
  end

  def new_train
    train_class = train_class_choice
    begin
      puts "Введите номер поезда"
      number = gets.chomp
      train = train_class.new(number)
      puts "Поезд номер #{train.number} успешно создан"
    rescue RuntimeError => e
      puts e.message
      retry
    end
    puts "Список пассажирских поездов"
    puts PassengerTrain.all.to_s
    puts "Список грузовых поездов"
    puts CargoTrain.all.to_s
  end

  def train_class_choice
    loop do
      puts "Какой тип поезда Вас интересует?"
      puts "1 - Пассажирский"
      puts "2 - Грузовой"
      train_type = gets.chomp
      case train_type
        when "1"
          return PassengerTrain
        when "2"
          return CargoTrain
      end
    end
  end

  def all_trains
    PassengerTrain.all.merge(CargoTrain.all)
  end

  def trains_list
    all_trains.each { |number, train| puts "Поезд № #{train.number}, тип: #{train.type}, количество вагонов: #{train.wagons.length}" }
  end

  def add_route_using_menu
    current_train.add_route(route_choice)
  end

  def train_wagons_list(train)
    train.each_wagon do |number, wagon|
      if wagon.class == PassengerWagon
        inf = "кол-во свободных мест: #{wagon.free_space}, кол-во занятых мест: #{wagon.occupied_space}"
      elsif wagon.class == CargoWagon
        inf = "свободный объем: #{wagon.free_space}, занятый объем: #{wagon.occupied_space}"
      end
      puts "№ #{number}, Тип: #{wagon.type}, " + inf
    end
  end

  def current_train_choice
    loop do
      trains_list

      puts "Выберите поезд из списка"

      current_train_number = gets.chomp
      self.current_train = all_trains[current_train_number]
      break if !current_train.nil?
    end
  end

# Routes

  def seed_routes
    station1 = Station.new("Minsk")
    station2 = Station.new("Moskow")
    route1 = Route.new(station1, station2)
    self.all_routes = [route1]
  end

  def new_route
    stations_list(Station.all)
    puts "Выберите из списка станцию отправления"
    first_station_index = gets.chomp.to_i - 1
    first_station = Station.all[first_station_index]
    puts "Выберите из списка конечную станцию"
    end_station_index = gets.chomp.to_i - 1
    end_station = Station.all[end_station_index]
    route = Route.new(first_station, end_station)
    all_routes << route
    puts "Список маршрутов"
    puts all_routes.to_s
  end

  def all_routes_list
    all_routes.each { |route| puts "#{all_routes.index(route) + 1} - #{route.stations.first.name} - #{route.stations.last.name}"}
  end

  def add_station_using_menu
    stations_list(Station.all)
    puts "Выберите из списка станцию, которую хотите добавить"
    station_index = gets.chomp.to_i - 1
    station = Station.all[station_index]
    current_route.add_station(station)
  end

  def remove_station_using_menu
    stations_list(current_route.stations)
    puts "Выберите из списка станцию, которую хотите удалить (начальную и конечную станции удалять нельзя)"
    station_index = gets.chomp.to_i - 1
    station = current_route.stations[station_index]
    current_route.remove_station(station)
  end

  def route_choice
    loop do
      all_routes_list
      puts "Выберите из списка маршрут, который хотите назначить выбранному ранее поезду"
      route_index = gets.chomp.to_i - 1
      route = all_routes[route_index]
      return route if !route.nil?
    end
  end

  def current_route_choice
    loop do
      puts "Выберите маршрут, который необходимо изменить"

      all_routes_list

      current_route_index = gets.chomp.to_i - 1
      self.current_route = all_routes[current_route_index]
      break if !current_route.nil?
    end
  end

# wagons

  def new_wagon
    if current_train.class == PassengerTrain
      puts "Введите количество мест в вагоне"
      seats = gets.chomp.to_i
      return PassengerWagon.new(seats)
    elsif current_train.class == CargoTrain
      puts "Введите объем вагона"
      value = gets.chomp.to_i
      return CargoWagon.new(value)
    end
  end

  def wagon_choice
    loop do
      if current_train.class == PassengerTrain
        puts "Введите номер вагона, в котором нужно занять место"
      elsif current_train.class == CargoTrain
        puts "Введите номер вагона, в который нужно загрузить груз"
      end

      wagon_number = gets.chomp.to_i
      wagon = current_train.wagons[wagon_number]
      return wagon if !wagon.nil?
    end
  end

  def fill_volume_using_menu
    wagon = wagon_choice
    puts "Какой объем груза?"
    volume = gets.chomp.to_i
    wagon.occupy_space(volume)
  end

  def take_seat_using_menu
    wagon_choice.occupy_space
  end

  def main_menu
    loop do
      MAIN_MENU.each { |item| puts item}

      menu = gets.chomp

      case menu
        when "1"
          new_station
        when "2"
          new_train
        when "3"
          new_route
        when "4"
          routes_menu
        when "5"
          trains_menu
        when "6"
          puts "Список станций"
          stations_list(Station.all)
        when "7"
          puts "Список поездов"
          trains_list
        when "8"
          puts "Список маршрутов"
          all_routes_list
        when "q"
          break
      end
    end
  end

  def routes_menu
    current_route_choice
    loop do
      ROUTES_MENU.each { |item| puts item}

      routes_menu = gets.chomp

      case routes_menu
      when "1"
        add_station_using_menu
        stations_list(current_route.stations)
      when "2"
        remove_station_using_menu
      when "b"
        break
      end
    end
  end

  def trains_menu
    current_train_choice
    loop do
      TRAINS_MENU.each { |item| puts item}

      trains_menu = gets.chomp

      case trains_menu
      when "1"
        add_route_using_menu
      when "2"
        current_train.add_wagon(new_wagon)
        puts "Количество вагонов #{current_train.wagons.length}"
      when "3"
        current_train.remove_wagon
        puts "Количество вагонов #{current_train.wagons.length}"
      when "4"
        current_train.to_next_station
      when "5"
        current_train.to_previous_station
      when "6"
        wagons_menu
      when "b"
        break
      end
    end
  end

  def wagons_menu
    puts "Список вагонов поезда № #{current_train.number}"
    train_wagons_list(current_train)
    if current_train.class == PassengerTrain
      take_seat_using_menu
    elsif current_train.class == CargoTrain
      fill_volume_using_menu
    end

  end
end
