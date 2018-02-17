module RoutesMenu
  ROUTES_MENU_PUTS = [
    'Операции с маршрутами:', '1 - Добавить промежуточную станцию к маршруту',
    '2 - Удалить промежуточную станцию из маршрута',
    'b - Вернуться назад'
  ].freeze

  def routes_menu_methods
    { '1' => :add_station_using_menu, '2' => :remove_station_using_menu }
  end

  def routes_menu
    current_route_choice

    loop do
      ROUTES_MENU_PUTS.each { |item| puts item }

      menu_index = gets.chomp

      break if menu_index == 'b'
      routes_method = routes_menu_methods[menu_index]
      send routes_method unless routes_method.nil?
    end
  end

  def seed_routes
    station1 = Station.new('Minsk')
    station2 = Station.new('Moskow')
    route1 = Route.new(station1, station2)
    self.all_routes = [route1]
  end

  def first_station
    puts 'Выберите из списка станцию отправления'
    Station.all[gets.chomp.to_i - 1]
  end

  def end_station
    puts 'Выберите из списка конечную станцию'
    Station.all[gets.chomp.to_i - 1]
  end

  def new_route
    stations_list(Station.all)
    route = Route.new(first_station, end_station)
    all_routes << route
  end

  def all_routes_list
    puts 'Список маршрутов'
    all_routes.each do |route|
      puts "#{all_routes.index(route) + 1} - #{route}"
    end
  end

  def add_station_using_menu
    stations_list(Station.all)
    puts 'Выберите из списка станцию, которую хотите добавить'
    station_index = gets.chomp.to_i - 1
    station = Station.all[station_index]
    current_route.add_station(station)
  end

  def remove_station_using_menu
    stations_list(current_route.stations)
    puts 'Выберите из списка станцию, которую хотите удалить'
    puts '(начальную и конечную станции удалять нельзя)'
    station_index = gets.chomp.to_i - 1
    station = current_route.stations[station_index]
    current_route.remove_station(station)
  end

  def route_choice
    loop do
      all_routes_list
      puts 'Выберите из списка маршрут, который хотите назначить поезду'
      route_index = gets.chomp.to_i - 1
      route = all_routes[route_index]
      return route unless route.nil?
    end
  end

  def current_route_choice
    loop do
      puts 'Выберите маршрут, который необходимо изменить'

      all_routes_list

      current_route_index = gets.chomp.to_i - 1
      self.current_route = all_routes[current_route_index]
      break unless current_route.nil?
    end
  end

  protected

  attr_accessor :all_routes, :current_route
end
