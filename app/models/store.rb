require 'carrierwave/orm/activerecord'

class Store < ActiveRecord::Base

  belongs_to :user, inverse_of: :store

  mount_uploader :logo, StoreLogoUploader

  validates_presence_of :name, :user, :slug
  validates_uniqueness_of :slug

end
