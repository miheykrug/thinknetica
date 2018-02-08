class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    if trains.include?(train)
      puts "Поезд № #{train.number} уже на станции #{name}"
    else
      trains << train
      puts "Поезд № #{train.number} прибыл на станцию #{name}"
    end
  end

  def get_trains(train_class)
    trains.select { |train| train.class == train_class }
  end

  def train_departure(train)
    if trains.include?(train)
      trains.delete(train)
      puts "Поезд № #{train.number} отправился со станции #{name}"
    else
      puts "Такого поезда нет на станции #{name}"
    end
  end
end
