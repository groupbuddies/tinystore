class Product < ActiveRecord::Base
  belongs_to :store

  mount_uploader :picture, ProductPictureUploader

  monetize :price_cents

  validates_presence_of :name, :price
  validates :description, length: { maximum: 140 }
end
