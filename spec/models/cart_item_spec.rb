require 'spec_helper'

describe CartItem do
  describe '#price' do
    it 'persists after changing price of it\'s items' do
      item = CartItem.create(cart: build_stubbed(:cart), product: build_stubbed(:product), amount: 1)
      item.product.increment :price_cents, 10

      item.price.should_not eq item.product.price
    end
  end
end
