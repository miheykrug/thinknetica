class Menu
  MAIN_MENU = ["Выберите действие:", "1 - Создать станцию", "2 - Создать поезд", "3 - Создать маршрут",
              "4 - Маршруты", "5 - Поезда", "6 - Список станций", "7 - Список поездов", "8 - Список маршрутов",
              "q - Выйти из программы"]
  ROUTES_MENU = ["Операции с маршрутами:", "1 - Добавить промежуточную станцию к маршруту",
                 "2 - Удалить промежуточную станцию из маршрута", "b - Вернуться назад"]
  TRAINS_MENU = ["Операции с поездами:", "1 - Назначить маршрут поезду", "2 - Добавить вагон к поезду",
                 "3 - Отцепить вагон от поезда", "4 - Переместить поезд на следующую станцию",
                 "5 - Переместить поезд на предыдущую станцию", "b - Вернуться назад"]

  attr_accessor :all_stations, :all_trains, :all_routes, :current_route, :current_train # Эти методы не в private,  т.к. используюся для начального заполнения массивов в main.rb

  def run
    main_menu
  end

  private

  attr_reader

  def initialize
    @all_stations = []
    @all_trains = []
    @all_routes = []
  end

  def new_station
    puts "Ведите название станции"
    station = Station.new(gets.chomp)
    all_stations << station
    puts "Список станций"
    puts all_stations.to_s
  end

  def get_trains(train_class)
    all_trains.select { |train| train.class == train_class }
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

  def new_train
    train_class = train_class_choice
    puts "Введите номер поезда"
    number = gets.chomp.to_i
    train = train_class.new(number)
    all_trains << train
    puts "Список пассажирских поездов"
    puts get_trains(PassengerTrain).to_s
    puts "Список грузовых поездов"
    puts get_trains(CargoTrain).to_s

  end

  def all_stations_list(stations)
    stations.each { |station| puts "#{stations.index(station) + 1} - #{station.name}" }
  end

  def all_routes_list
    all_routes.each { |route| puts "#{all_routes.index(route) + 1} - #{route.stations.first.name} - #{route.stations.last.name}"}
  end

  def new_route
    all_stations_list(all_stations)
    puts "Выберите из списка станцию отправления"
    first_station_index = gets.chomp.to_i - 1
    first_station = all_stations[first_station_index]
    puts "Выберите из списка конечную станцию"
    end_station_index = gets.chomp.to_i - 1
    end_station = all_stations[end_station_index]
    route = Route.new(first_station, end_station)
    all_routes << route
    puts "Список маршрутов"
    puts all_routes.to_s
  end

  def add_station_using_menu
    all_stations_list(all_stations)
    puts "Выберите из списка станцию, которую хотите добавить"
    station_index = gets.chomp.to_i - 1
    station = all_stations[station_index]
    current_route.add_station(station)
  end

  def remove_station_using_menu
    all_stations_list(current_route.stations)
    puts "Выберите из списка станцию, которую хотите удалить (начальную и конечную станции удалять нельзя)"
    station_index = gets.chomp.to_i - 1
    station = current_route.stations[station_index]
    current_route.remove_station(station)
  end

  def trains_list(trains)
      trains.each { |train| puts "#{trains.index(train) + 1} - Поезд номер #{train.number}, класс: #{train.class}" }
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

  def add_route_using_menu
      current_train.add_route(route_choice)
  end

  def new_wagon
    return PassengerWagon.new if current_train.class == PassengerTrain
    return CargoWagon.new if current_train.class == CargoTrain
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

  def current_train_choice
    loop do
      trains_list(all_trains)

      puts "Выберите поезд из списка"

      current_train_index = gets.chomp.to_i - 1
      self.current_train = all_trains[current_train_index]
      break if !current_train.nil?
    end
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
          all_stations_list(all_stations)
        when "7"
          puts "Список поездов"
          trains_list(all_trains)
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
        all_stations_list(current_route.stations)
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
      when "b"
        break
      end
    end
  end
end
