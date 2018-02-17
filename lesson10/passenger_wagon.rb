class PassengerWagon < Wagon
  def initialize(space)
    @type = 'пассажитрский'
    super
  end

  def occupy_space
    super 1
  end
end
