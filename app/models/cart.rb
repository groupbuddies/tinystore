class Cart < ActiveRecord::Base
  belongs_to :store

  has_many :items, class_name: 'CartItem'
  has_one :checkout

  def price
    items.map(&:price).sum
  end

  def sanitize
    items.where(amount: 0).destroy_all
    self
  end
end
