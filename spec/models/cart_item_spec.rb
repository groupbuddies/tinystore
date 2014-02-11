require 'spec_helper'

describe CartItem do
  describe '#price' do
    it 'persists after changing price of it\'s items' do
      checkout = Checkout.create(valid_checkout_params)
      checkout.cart.items.first.increment price: 10

      checkout.price.should_not eq previous_price
    end
  end
end
