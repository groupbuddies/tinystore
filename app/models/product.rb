class Product < ActiveRecord::Base
  belongs_to :store

  mount_uploader :picture, ProductPictureUploader

  monetize :price_cents
end
