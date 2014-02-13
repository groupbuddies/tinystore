class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  monetize :unitary_price_cents

  validates_presence_of :cart, :amount, :product
  validates_uniqueness_of :product, scope: :cart_id
  validates :amount, numericality: { greater_or_equal_than: 0 }

  before_validation :set_initial_amount
  before_create :set_product_price
  after_save :destroy_if_amount_is_zero

  def price
    self.unitary_price * amount
  end

  private

  def destroy_if_amount_is_zero
    if amount <= 0
      destroy
      false
    else
      true
    end
  end

  def set_initial_amount
    self.amount ||= 1
  end

  def set_product_price
    self.unitary_price = product.price
  end
end
