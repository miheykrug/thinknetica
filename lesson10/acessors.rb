module Acessors
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)

          name_history = instance_variable_get(var_name_history)
          name_history ||= []
          instance_variable_set(var_name_history, name_history << value)
        end
        define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }
      end
    end

    def strong_attr_acessor(name, true_class)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        if value.instance_of? true_class
          instance_variable_set(var_name, value)
        else
          raise "value '#{value}' is not #{true_class} class"
        end
      end
    end
  end

  module InstanceMethods
  end
end
