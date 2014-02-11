class PriceFromCheckoutToCartItems < ActiveRecord::Migration
  def change
    remove_money :checkouts, :price

    add_money :cart_items, :unitary_price
  end
end
