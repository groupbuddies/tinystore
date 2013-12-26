module Serializers
  class Raw
    def initialize(object)
      @object = object
    end

    def serialize(attrs_method: :attributes)
      attributes = object.public_send(attrs_method)
      get_real_attributes_from(attributes).merge(errors)
    end

    private
    attr_reader :object

    def get_real_attributes_from(attributes)
      if attributes.is_a? Hash
        attributes
      else
        create_attributes_hash attributes
      end
    end

    def create_attributes_hash(attributes)
      attributes.inject({}) do |value, ivar|
        attribute_name = var_name_to_attribute_name(ivar)
        value[attribute_name] = object.public_send(attribute_name)
        value
      end
    end

    def var_name_to_attribute_name(variable_name)
      variable_name.to_s.tr('@', '').to_sym
    end

    def errors
      if object.errors.any?
        { errors: object.errors.messages }
      else
        {}
      end
    end
  end
end
