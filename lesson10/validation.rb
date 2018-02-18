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
        attribute_val = instance_variable_get("@#{attribute}".to_sym)
        validations.each { |meth, arg| send(meth, attribute, attribute_val,arg) }
      end
      true
    end

    def valid?
      validate!
    rescue StandardError
      false
    end

    protected

    def presence(attribute, attribute_val, arg)
      raise "#{attribute} can't be nil" if arg && attribute_val.nil?
    end

    def format(attribute, attribute_val, pattern)
      raise "#{attribute} has invalid format" if attribute_val !~ pattern
    end

    def type(attribute, attribute_val, true_class)
      raise "#{attribute} is not #{true_class} class" unless attribute_val.instance_of? true_class
    end

    def length(attribute, attribute_val, num)
      raise "#{attribute} should be at least #{num} symbols" if attribute_val.length < num
    end
  end
end
