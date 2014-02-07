require 'carrierwave/orm/activerecord'

class Store < ActiveRecord::Base

  belongs_to :user, inverse_of: :store
  has_many :products
  has_many :carts

  mount_uploader :logo, StoreLogoUploader

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug
  validates :description, length: { maximum: 140 }

end
