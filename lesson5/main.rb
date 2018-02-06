require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'

station1 = Station.new("Minsk")
station2 = Station.new("Moskow")
station3 = Station.new("Volozhin")
station4 = Station.new("Smolensk")

route1 = Route.new(station1, station2)

train1 = CargoTrain.new(1)
train2 = PassengerTrain.new(2)



all_stations = [station1, station2, station3, station4]
all_passenger_trains = [train2]
all_cargo_trains = [train1]
all_routes = [route1]

current_route = 0
current_train = 0

def new_station(all_stations)
  puts "Ведите название станции"
  station = Station.new(gets.chomp)
  all_stations << station
  puts "Список станций"
  puts all_stations.to_s
end

def new_train(all_passenger_trains, all_cargo_trains)
  puts "Какой тип поезда Вы хотите создать"
  puts "1 - Пассажирский"
  puts "2 - Грузовой"
  type = gets.chomp
  puts "Введите номер поезда"
  number = gets.chomp.to_i
  case type
    when "1"
      train = PassengerTrain.new(number)
      all_passenger_trains << train
    when "2"
      train = CargoTrain.new(number)
      all_cargo_trains << train
  end
  puts "Список пассажирских поездов"
  puts all_passenger_trains.to_s
  puts "Список грузовых поездов"
  puts all_cargo_trains.to_s

end

def all_stations_list(all_stations)
  all_stations.each { |station| puts "#{all_stations.index(station) + 1} - #{station.name}" }
end

def all_routes_list(all_routes)
  all_routes.each { |route| puts "#{all_routes.index(route) + 1} - #{route.stations.first.name} - #{route.stations.last.name}"}
end

def new_route(all_routes, all_stations)
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

def add_station_using_menu(current_route, all_stations)
  # all_routes_list(all_routes)
  # puts "Выберите из списка маршрут, в который хотите добавить станцию"
  # route_index = gets.chomp.to_i - 1
  # route = all_routes[route_index]
  all_stations_list(all_stations)
  puts "Выберите из списка станцию, которую хотите добавить"
  station_index = gets.chomp.to_i - 1
  station = all_stations[station_index]
  current_route.add_station(station)
  # puts all_routes.to_s
end

def remove_station_using_menu(current_route, all_routes)
  # all_routes_list(all_routes)
  # puts "Выберите из списка маршрут, из которого хотите удалить станцию"
  # route_index = gets.chomp.to_i - 1
  # route = all_routes[route_index]
  all_stations_list(current_route.stations)
  puts "Выберите из списка станцию, которую хотите удалить (начальную и конечную станции удалять нельзя)"
  station_index = gets.chomp.to_i - 1
  station = current_route.stations[station_index]
  current_route.remove_station(station)
  # puts all_routes.to_s
end

def trains_list(trains_array)
    trains_array.each { |train| puts "#{trains_array.index(train) + 1} - Поезд номер #{train.number}" }
end

def add_route_using_menu(current_train, all_routes)
  # puts "Какой тип поезда Вы хотите создать"
  # puts "1 - Пассажирский"
  # puts "2 - Грузовой"
  # type = gets.chomp
  # case type
  #   when "1"
  #     puts "Пассажирские поезда:"
  #     trains = all_passenger_trains
  #   when "2"
  #     puts "Грузовые поезда:"
  #     trains = all_cargo_trains
  # end
  # trains_list(trains)
  # puts "Выберите поезд из списка"
  # train_index = gets.chomp.to_i
  # train = trains[train_index]
  all_routes_list(all_routes)
  puts "Выберите из списка маршрут, который хотите назначить выбранному ранее поезду"
  route_index = gets.chomp.to_i - 1
  route = all_routes[route_index]
  current_train.add_route(route)
end




loop do
  puts "Выберите действие:"
  puts "1 - Создать станцию"
  puts "2 - Создать поезд"
  puts "3 - Создать маршрут"
  puts "4 - Маршруты"
  puts "5 - Поезда"
  puts "6 - Список станций"
  puts "7 - Список поездов"
  puts "8 - Список маршрутов"
  puts "q - Выйти из программы"

  menu = gets.chomp

  case menu
    when "1"
      new_station(all_stations)
    when "2"
      new_train(all_passenger_trains, all_cargo_trains)
    when "3"
      new_route(all_routes, all_stations)
    when "4"
      puts "Выберите маршрут, который необходимо изменить"

      all_routes_list(all_routes)

      current_route_index = gets.chomp.to_i - 1
      current_route = all_routes[current_route_index]
      loop do
        puts "Операции с маршрутами:"
        puts "1 - Добавить промежуточную станцию к маршруту"
        puts "2 - Удалить промежуточную станцию из маршрута"
        puts "b - Вернуться назад"

        routes_menu = gets.chomp

        case routes_menu
        when "1"
          add_station_using_menu(current_route, all_stations)
        when "2"
          remove_station_using_menu(current_route, all_routes)
        when "b"
          break
        end
      end
    when "5"
      puts "Какой тип поезда Вас интересует?"
      puts "1 - Пассажирский"
      puts "2 - Грузовой"

      train_type = gets.chomp

      case train_type
        when "1"
          puts "Пассажирские поезда:"
          trains = all_passenger_trains
        when "2"
          puts "Грузовые поезда:"
          trains = all_cargo_trains
      end
      trains_list(trains)

      puts "Выберите поезд из списка"

      current_train_index = gets.chomp.to_i - 1
      current_train = trains[current_train_index]

      loop do
        puts "Операции с поездами:"
        puts "1 - Назначить маршрут поезду"
        puts "2 - Добавить вагон к поезду"
        puts "3 - Отцепить вагон от поезда"
        puts "4 - Переместить поезд на следующую станцию"
        puts "5 - Переместить поезд на предыдущую станцию"
        puts "b - Вернуться назад"

        trains_menu = gets.chomp

        case trains_menu
        when "1"
          add_route_using_menu(current_train, all_routes)
        when "2"
          case train_type
            when "1"
              new_wagon = PassengerWagon.new
            when "2"
              new_wagon = CargoWagon.new
          end
          current_train.add_wagon(new_wagon)
        when "3"
          current_train.remove_wagon
        when "4"
          current_train.to_next_station
        when "5"
          current_train.to_previous_station
        when "b"
          break
        end
      end
    when "6"
      puts "Список станций"
      all_stations_list(all_stations)
    when "7"
      puts "Список поездов"
      puts "а) пассажирские"
      trains_list(all_passenger_trains)
      puts "б) грузовые"
      trains_list(all_cargo_trains)
    when "8"
      puts "Список маршрутов"
      all_routes_list(all_routes)
    when "q"
      break
  end
end




# station1 = Station.new("Minsk")
# station2 = Station.new("Moskow")
# station3 = Station.new("Volozhin")
# station4 = Station.new("Smolensk")

# route1 = Route.new(station1, station2)

# train1 = CargoTrain.new(1)
# train2 = PassengerTrain.new(2)

# wagon1 = CargoWagon.new
# wagon2 = CargoWagon.new
# wagon3 = PassengerWagon.new
# wagon4 = PassengerWagon.new


# puts "-------Проверка станции-----"
# puts
# station1.take_train(train1)
# station1.take_train(train1)
# station1.take_train(train1)
# station1.take_train(train2)
# puts station1.trains.to_s
# puts station1.get_trains(CargoTrain).to_s
# puts station1.get_trains(PassengerTrain).to_s
# station1.train_departure(train1)
# station1.train_departure(train1)
# puts station1.trains.to_s

# puts
# puts "------Проверка маршрута--------"
# puts

# route1.add_station(station3)
# route1.add_station(station4)
# route1.list_stations
# route1.remove_station(station4)
# route1.remove_station(station1)
# route1.list_stations
# route1.add_station(station4)

# puts
# puts "------Добавление вагонов (груз. поезд)-----"
# puts

# train1.add_wagon(wagon1)
# train1.add_wagon(wagon1)
# train1.add_wagon(wagon2)
# train1.add_wagon(wagon3)
# train1.add_wagon(wagon4)
# puts train1.wagons.to_s
# train1.remove_wagon(wagon2)
# puts train1.wagons.to_s

# puts
# puts "------Добавление вагонов (пасс. поезд)-----"
# puts

# train2.add_wagon(wagon1)
# train2.add_wagon(wagon2)
# train2.add_wagon(wagon3)
# train2.add_wagon(wagon3)
# train2.add_wagon(wagon4)
# puts train2.wagons.to_s
# train2.remove_wagon(wagon4)
# puts train2.wagons.to_s

# puts
# puts "-------Движение по маршруту-------"
# puts
# train1.add_route(route1)
# train1.route.list_stations
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_next_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_next_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_next_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_next_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_previous_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_previous_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_previous_station
# puts train1.current_station.name
# train1.current_station.trains
# train1.to_previous_station
# puts train1.current_station.name
# train1.current_station.trains

# puts
# puts "-----Изменение скорости---------"
# puts
# train1.increase_speed(50)
# puts train1.speed
# train1.reduse_speed(20)
# puts train1.speed
# train1.reduse_speed(50)
# puts train1.speed
