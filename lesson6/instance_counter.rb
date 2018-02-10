module InstanceCounter
  def self.included(base)
    base.extend         ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances, :all
  end

  module InstanceMethods
    protected

    def add_to_all
      self.class.all ||= []
      self.class.all << self
    end

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
