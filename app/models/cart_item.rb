class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_presence_of :cart, :amount, :product
  validates_uniqueness_of :product, scope: :cart_id
  validates :amount, numericality: { greater_or_equal_than: 0 }
  after_save :destroy_if_amount_is_zero
  before_validation :set_initial_amount

  def price
    product.price * amount
  end

  private

  def destroy_if_amount_is_zero
    destroy if amount < 0
  end

  def set_initial_amount
    self.amount ||= 1
  end
end
