class PassengerTrain < Train
  def initialize(number)
    @type = "пассажитрский"
    super
  end

  def add_wagon(wagon)
    return puts "К пассажирскому поезду можно прицепить только пассажирские вагоны" if wagon.class != PassengerWagon
    super
  end
end
