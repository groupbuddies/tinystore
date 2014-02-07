class Cart < ActiveRecord::Base
  belongs_to :store

  has_many :items, class_name: 'CartItem'
end
