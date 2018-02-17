module StationsMenu
  def seed_stations
    Station.new('Volozhin')
    Station.new('Smolensk')
  end

  def new_station
    begin
      puts 'Ведите название станции'
      Station.new(gets.chomp)
    rescue => e
      puts e.message
      retry
    end

    puts 'Список станций'
    puts Station.all.to_s
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
end
