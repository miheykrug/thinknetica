class Wagon
  include Manufacturer

  attr_reader :number, :type

  @@number = 0

  def initialize
    @number = @@number += 1
  end
end
