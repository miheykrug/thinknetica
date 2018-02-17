class Menu
  include TrainsMenu
  include RoutesMenu
  include StationsMenu
  include WagonsMenu

  MAIN_MENU_PUTS = [
    'Выберите действие:', '1 - Создать станцию', '2 - Создать поезд',
    '3 - Создать маршрут', '4 - Маршруты', '5 - Поезда', '6 - Список станций',
    '7 - Список поездов', '8 - Список маршрутов',
    'q - Выйти из программы'
  ].freeze

  def initialize
    @all_routes = []
  end

  def run
    seed_routes
    seed_stations
    seed_trains

    main_menu
  end

  def main_menu_methods
    { '1' => :new_station, '2' => :new_train, '3' => :new_route,
      '4' => :routes_menu, '5' => :trains_menu, '6' => :trains_on_stations_list,
      '7' => :trains_list, '8' => :all_routes_list }
  end

  def main_menu
    loop do
      MAIN_MENU_PUTS.each { |item| puts item }
      menu = gets.chomp
      break if menu == 'q'
      menu_method = main_menu_methods[menu]
      send menu_method unless menu_method.nil?
    end
  end
end
