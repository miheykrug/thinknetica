module StationsMenu
  STATIONS_MENU_PUTS = [
    'Операции со станциями:', '1 - Изменить имя станции',
    '2 - История изменений имени станции',
    'b - Вернуться назад'
  ].freeze

  def stations_menu_methods
    { '1' => :change_station_name, '2' => :station_name_history }
  end

  def stations_menu
    current_station_choice

    loop do
      STATIONS_MENU_PUTS.each { |item| puts item }

      menu_index = gets.chomp

      break if menu_index == 'b'
      station_method = stations_menu_methods[menu_index]
      send station_method unless station_method.nil?
    end
  end

  def seed_stations
    Station.new('Volozhin')
    Station.new('Smolensk')
  end

  def new_station
    begin
      puts 'Ведите название станции'
      Station.new(gets.chomp)
    rescue StandardError => e
      puts e.message
      retry
    end

    puts 'Список станций'
    puts Station.all.to_s
  end

  def current_station_choice
    loop do
      stations_list(Station.all)
      puts 'Выберите станцию из списка'
      station_index = gets.chomp.to_i - 1
      self.current_station = Station.all[station_index]
      break unless current_station.nil?
    end
  end

  def change_station_name
    puts 'Введите новое название станции'
    current_station.name = gets.chomp
  end

  def station_name_history
    puts 'История названий станции'
    puts current_station.name_history
  end

  def stations_list(stations)
    stations.each do |station|
      puts "#{stations.index(station) + 1} - #{station.name}"
    end
  end

  def trains_on_stations_list
    puts 'Список станций'
    Station.all.each do |station|
      puts "#{Station.all.index(station) + 1} - #{station.name}"
      puts 'Поезда на станции:'
      station.each_train { |train| puts train.to_s }
    end
  end

  protected

  attr_accessor :current_station
end
