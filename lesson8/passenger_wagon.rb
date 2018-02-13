class PassengerWagon < Wagon
  def initialize(space)
    @type = "пассажитрский"
    super
  end

  def occupy_space(loading = 1)
    super
  end
end
