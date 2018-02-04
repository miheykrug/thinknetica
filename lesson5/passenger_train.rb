class PassengerTrain < Train

  def add_wagon(wagon)

    if wagon.class == PassengerWagon
      super
    else
      puts "К пассажирскому поезду можно прицепить только пассажирские вагоны"
    end

  end

end
