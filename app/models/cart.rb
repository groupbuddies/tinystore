class Cart < ActiveRecord::Base
  belongs_to :store

  has_many :items, class_name: 'CartItem'

  def size
    items.count
  end

  def price
    items.map(&:price).sum
  end
end
