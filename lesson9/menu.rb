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

  def main_menu
    main_menu = {
      '1' => proc { new_station }, '2' => proc { new_train },
      '3' => proc { new_route }, '4' => proc { routes_menu },
      '5' => proc { trains_menu },
      '6' => proc { trains_on_stations_list },
      '7' => proc { trains_list },
      '8' => proc { all_routes_list }
    }

    loop do
      MAIN_MENU_PUTS.each { |item| puts item }
      menu = gets.chomp
      break if menu == 'q'
      main_menu[menu].call
    end
  end
end
