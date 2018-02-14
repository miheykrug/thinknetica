module WagonsMenu
  def wagons_menu
    puts "Список вагонов поезда № #{current_train.number}"
    train_wagons_list(current_train)
    if current_train.class == PassengerTrain
      take_seat_using_menu
    elsif current_train.class == CargoTrain
      fill_volume_using_menu
    end
  end

  def space
    msg = {
      PassengerTrain => 'Введите количество мест в вагоне',
      CargoTrain => 'Введите объем вагона'
    }

    puts msg[current_train.class]
    gets.chomp.to_i
  end

  def new_wagon
    if current_train.class == PassengerTrain
      PassengerWagon.new(space)
    elsif current_train.class == CargoTrain
      CargoWagon.new(space)
    end
  end

  def wagon_choice
    loop do
      msg = {
        PassengerTrain => 'Введите номер вагона, в котором нужно занять место',
        CargoTrain => 'Введите номер вагона, в который нужно загрузить груз'
      }
      puts 'b - Вернуться назад'
      puts msg[current_train.class]
      wagon_number = gets.chomp
      break if wagon_number == 'b'
      wagon = current_train.wagons[wagon_number.to_i]
      return wagon unless wagon.nil?
    end
  end

  def fill_volume_using_menu
    wagon = wagon_choice
    puts 'Какой объем груза?'
    volume = gets.chomp.to_i
    wagon.occupy_space(volume)
  end

  def take_seat_using_menu
    wagon_choice.occupy_space unless wagon_choice.nil?
  end
end
