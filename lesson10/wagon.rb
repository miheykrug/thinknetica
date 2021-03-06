class Wagon
  include Manufacturer
  include Validation
  include Acessors

  attr_reader :number, :type, :occupied_space, :space
  strong_attr_accessor :train, Train
  validate :space, :presence, true

  @@number = 0

  def initialize(space)
    @space = space
    @occupied_space = 0
    @number = @@number += 1
  end

  def occupy_space(loading)
    if free_space - loading >= 0
      self.occupied_space += loading
    else
      puts 'Нет свободного места'
    end
  end

  def free_space
    space - occupied_space
  end

  protected

  attr_writer :occupied_space
end
