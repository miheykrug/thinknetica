module Validation
  def self.included(base)
    base.extend         ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :attr_validations

    def validate(attribute, validation, arg)
      self.attr_validations ||= {}
      attr_validations[attribute] ||= {}
      attr_validations[attribute].store(validation, arg)
    end
  end

  module InstanceMethods
    def validate!
      self.class.attr_validations.each do |attribute, validations|
        validations.each { |meth, arg| send(meth, attribute, arg) }
      end
      true
    end

    def valid?
      validate!
    rescue StandardError
      false
    end

    protected

    def presence(attribute, arg)
      attribute_val = instance_variable_get("@#{attribute}".to_sym)
      raise "#{attribute} can't be nil" if arg && attribute_val.nil?
    end

    def format(attribute, pattern)
      attribute_val = instance_variable_get("@#{attribute}".to_sym)
      raise "#{attribute} has invalid format" if attribute_val !~ pattern
    end

    def type(attribute, true_class)
      attribute_val = instance_variable_get("@#{attribute}".to_sym)
      raise "#{attribute} is not #{true_class} class" unless attribute_val.instance_of? true_class
    end

    def length(attribute, num)
      attribute_val = instance_variable_get("@#{attribute}".to_sym)
      raise "#{attribute} should be at least #{num} symbols" if attribute_val.length < num
    end
  end
end
