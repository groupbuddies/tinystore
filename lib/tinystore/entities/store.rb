require 'active_model'

class Store
  include ActiveModel::Validations
  ATTRIBUTES = [:id, :name, :description, :owner_email, :owner_password, :created_at, :updated_at]
  attr_accessor *ATTRIBUTES

  validates_presence_of :name, :owner_email, :owner_password

  def initialize(attrs = {})
    attrs.each do |attr_name, attr_value|
      public_send("#{attr_name}=", attr_value)
    end
    @repo = Repository.for(:store)
  end

  def valid?
    super &&
    repo.unique?(self, :name) &&
    repo.unique?(self, :owner_email)
  end

  def value(serializer: Serializers::Raw)
    serializer.new(self).serialize
  end

  def attributes
    ATTRIBUTES
  end

  private
  attr_reader :repo
end
