class PassengerWagon < Wagon
  attr_reader  :occupied_seats

  def initialize(seats)
    @seats = seats
    @occupied_seats = 0
    @type = "пассажитрский"
    super()
  end

  def take_seat
    if free_seats > 0
      self.occupied_seats += 1
    else
      puts "Все места заняты"
    end
  end

  def free_seats
    seats - occupied_seats
  end

  private

  attr_reader :seats
  attr_writer :occupied_seats
end
