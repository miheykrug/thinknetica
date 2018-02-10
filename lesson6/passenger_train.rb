class PassengerTrain < Train
  def add_wagon(wagon)
    return puts "К пассажирскому поезду можно прицепить только пассажирские вагоны" if wagon.class != PassengerWagon
    super
  end
end
