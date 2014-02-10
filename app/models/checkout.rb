class Checkout < ActiveRecord::Base

  belongs_to :store
  belongs_to :cart

  validates_presence_of :store, :cart, :price, :client_name, :client_email
  validate :client_email, email: true
  validate :cart_is_not_empty

  private

  def cart_is_not_empty
    errors.add(:cart, "is empty") if cart.items.empty?
  end

end
