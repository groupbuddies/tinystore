module FormObject
  module ModelMocker

    def self.included(base)
      base.class_eval do
        include ActiveModel::Validations
        include ActiveModel::Conversion
        extend ActiveModel::Naming
      end
      base.extend ClassMethods
    end

    def model_class
      self.class.model_class
    end

    module ClassMethods
      def model_name
        ActiveModel::Name.new(model_class)
      end

      def use_model?
        !@dont_use_model
      end

      def dont_use_model
        @dont_use_model = true
      end

      def model_class
        name = self.name.demodulize.to_sym
        if Object.const_defined?(name)
          "::#{name}".constantize
        else
          Object
        end
      end
    end
  end
end
