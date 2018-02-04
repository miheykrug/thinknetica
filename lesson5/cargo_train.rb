class CargoTrain < Train

  def add_wagon(wagon)

    if wagon.class == CargoWagon
      super
    else
      puts "К грузовому поезду можно прицепить только грузовые вагоны"
    end

  end

end
