class CargoTrain < Train
  def initialize(number)
    @type = 'грузовой'
    super
  end

  def add_wagon(wagon)
    if wagon.class != CargoWagon
      return puts 'К грузовому поезду можно прицепить только грузовые вагоны'
    end
    super
  end
end
