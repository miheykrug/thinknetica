module TrainsMenu
  TRAINS_MENU_PUTS = [
    'Операции с поездами:', '1 - Назначить маршрут поезду',
    '2 - Добавить вагон к поезду', '3 - Отцепить вагон от поезда',
    '4 - Переместить поезд на следующую станцию',
    '5 - Переместить поезд на предыдущую станцию', '6 - Вагоны поезда',
    'b - Вернуться назад'
  ].freeze

  def trains_menu_methods
    { '1' => :add_route_using_menu,
      '2' => :add_wagon_to_current_train,
      '3' => :remove_wagon_from_current_train,
      '4' => :current_train_to_next_station,
      '5' => :current_train_to_previous_station,
      '6' => :wagons_menu }
  end

  def trains_menu
    current_train_choice

    loop do
      TRAINS_MENU_PUTS.each { |item| puts item }

      menu_index = gets.chomp
      break if menu_index == 'b'
      trains_method = trains_menu_methods[menu_index]
      send trains_method unless trains_method.nil?
    end
  end

  def seed_trains
    CargoTrain.new('qew-12')
    PassengerTrain.new('qqw-11')
  end

  def add_wagon_to_current_train
    current_train.add_wagon(new_wagon)
  end

  def remove_wagon_from_current_train
    train_wagons_list(current_train)
    current_train.remove_wagon(wagon_choice)
  end

  def current_train_to_next_station
    current_train.to_next_station unless current_train.route.nil?
  end

  def current_train_to_previous_station
    current_train.to_previous_station unless current_train.route.nil?
  end

  def new_train
    train_class = train_class_choice
    begin
      puts 'Введите номер поезда'
      number = gets.chomp
      train = train_class.new(number)
      puts "Поезд номер #{train.number} успешно создан"
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def train_class_choice
    loop do
      puts 'Какой тип поезда Вас интересует?'
      puts '1 - Пассажирский'
      puts '2 - Грузовой'
      train_type = gets.chomp
      case train_type
      when '1' then return PassengerTrain
      when '2' then return CargoTrain
      end
    end
  end

  def all_trains
    PassengerTrain.all.merge(CargoTrain.all)
  end

  def trains_list
    puts 'Список поездов'
    all_trains.each_value { |train| puts train.to_s }
  end

  def add_route_using_menu
    current_train.add_route(route_choice)
  end

  def train_wagons_list(train)
    train.each_wagon do |number, wagon|
      if wagon.class == PassengerWagon
        inf1 = "кол-во свободных мест: #{wagon.free_space}"
        inf2 = "кол-во занятых мест: #{wagon.occupied_space}"
      elsif wagon.class == CargoWagon
        inf1 = "свободный объем: #{wagon.free_space}"
        inf2 = "занятый объем: #{wagon.occupied_space}"
      end
      puts "№ #{number}, Тип: #{wagon.type}, #{inf1}, #{inf2}"
    end
  end

  def current_train_choice
    loop do
      trains_list

      puts 'Выберите поезд из списка'

      current_train_number = gets.chomp
      self.current_train = all_trains[current_train_number]
      break unless current_train.nil?
    end
  end

  protected

  attr_accessor :current_train
end
