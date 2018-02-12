class CargoWagon < Wagon
  attr_reader :filled_volume

  def initialize(volume)
    @volume = volume
    @filled_volume = 0
    @type = "грузовой"
    super()
  end

  def fill_volume(cargo_volume)
    if (free_volume - cargo_volume) > 0
      self.filled_volume += cargo_volume
    else
      puts "Этот груз не влезет в вагон. Осталось только #{free_volume} куб.м "
    end
  end

  def free_volume
    volume - filled_volume
  end

  private

  attr_reader :volume
  attr_writer :filled_volume

end
