require 'active_model'

class Product
  include ActiveModel::Validations
  ATTRIBUTES = [:id, :name, :description, :price, :image, :store_id, :created_at, :updated_at]
  attr_accessor *ATTRIBUTES

  validates_presence_of :name, :price, :store_id

  def initialize(attrs = {})
    attrs.each do |attr_name, attr_value|
      public_send("#{attr_name}=", attr_value)
    end
  end

  def value(serializer: Serializers::Raw)
    serializer.new(self).serialize
  end

  def attributes
    ATTRIBUTES
  end
end
