class CargoTrain < Train
  def initialize(number)
    @type = "грузовой"
    super
  end

  def add_wagon(wagon)
    return puts "К грузовому поезду можно прицепить только грузовые вагоны" if wagon.class != CargoWagon
    super
  end
end
