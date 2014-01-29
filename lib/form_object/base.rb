module FormObject
  class Base
    include ModelMocker

    def initialize(attributes_or_model = {}, submitted_attributes = {})
      prepare_model(attributes_or_model)
      prepare_attributes(attributes_or_model, submitted_attributes)
    end

    def persisted?
      model.try :persisted?
    end

    def id
      model.try :id
    end

    def save
      raise "No model defined. You must override the #save method for this form object" if model.nil?
      if valid?
        model.update_attributes(attributes)
      end
    end

    def attributes
      Hash[self.class.attributes.map { |attr| [attr, public_send(attr)] }]
    end

    def self.attributes(*vars)
      @attributes ||= []
      @attributes.concat vars
      attr_accessor(*vars)
      @attributes
    end

    protected

    attr_reader :model

    def prepare_model(attributes_or_model)
      return unless self.class.use_model?
      @model = if attributes_or_model.is_a?(Hash)
        self.class.model_class.new(attributes_or_model)
      else
        attributes_or_model
      end
    end

    def prepare_attributes(default, submitted)
      default = default.attributes unless default.is_a?(Hash)
      attributes = default.stringify_keys.merge(submitted.stringify_keys)
      attributes.each do |name, value|
        send("#{name}=", value) if self.class.attributes.include?(name.to_sym)
      end
    end
  end
end
