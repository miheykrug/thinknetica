class PassengerTrain < Train
  attr_accessor_with_history :route

  def initialize(number)
    @type = 'пассажитрский'
    super
  end

  def add_wagon(wagon)
    msg = 'К пассажирскому поезду можно прицепить только пассажирские вагоны'
    return puts msg if wagon.class != PassengerWagon
    super
  end
end
