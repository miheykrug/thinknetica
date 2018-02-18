class Station
  include InstanceCounter
  include Validation
  include Acessors

  attr_reader :trains
  attr_accessor_with_history :name

  validate :name, :presence, true
  validate :name, :length, 3

  class << self
    attr_accessor :all
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
    add_to_all
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  def take_train(train)
    if trains.include?(train)
      puts "Поезд № #{train.number} уже на станции #{name}!"
    else
      puts "Поезд № #{train.number} прибыл на станцию #{name}"
      trains << train
    end
  end

  def get_trains(train_class)
    trains.select { |train| train.class == train_class }
  end

  def train_departure(train)
    if trains.include?(train)
      puts "Поезд № #{train.number} отправился со станции #{name}"
      trains.delete(train)
    else
      puts "Такого поезда нет на станции #{name}"
    end
  end

  private

  def add_to_all
    self.class.all ||= []
    self.class.all << self
  end
end
