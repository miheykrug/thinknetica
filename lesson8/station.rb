class Station
  include InstanceCounter

  attr_reader :trains
  attr_accessor :name

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

  def valid?
    validate!
  rescue
    false
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

  def validate!
    raise "Name of station can't be nil" if name.nil?
    raise "Name should be at least 3 symbols" if name.length < 3
    true
  end
end
