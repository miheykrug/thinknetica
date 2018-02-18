class CargoTrain < Train
  attr_accessor_with_history :route

  def initialize(number)
    @type = 'грузовой'
    super
  end

  def add_wagon(wagon)
    return super if wagon.instance_of? CargoWagon
    puts 'К грузовому поезду можно прицепить только грузовые вагоны'
  end
end
