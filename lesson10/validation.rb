module Validation
  def self.included(base)
    base.extend         ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validation, *arg)
      var_attr_validations = "@#{attribute}_validations".to_sym
      attr_validations = instance_variable_get(var_attr_validations)
      attr_validations ||= {}
      attr_validations[validation] = arg.first
      instance_variable_set(var_attr_validations, attr_validations)
      define_method(:validate!) do
        attr_validations.each { |meth, arg| self.send(meth, attribute, arg) }
        true
      end
    end
  end

  module InstanceMethods
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
