require 'spec_helper'

describe Checkout do

  describe '#valid?' do
    it 'checks if cart is empty' do
      checkout = Checkout.new(valid_checkout_params.merge(cart: create(:cart)))

      checkout.should_not be_valid
    end
  end

  describe '#price' do
    it 'equals the cart\'s price' do
      checkout = Checkout.create(valid_checkout_params)

      checkout.price.should eq checkout.cart.price
    end
  end

  describe '#send_emails' do
    it 'sends both emails upon creating a new checkout' do
      expect {
        Checkout.create(valid_checkout_params)
      }.to change { ActionMailer::Base.deliveries.size }.by(2)
    end
  end

  private

  def valid_checkout_params
    return { store: create(:store), cart: create(:cart_with_items), client_name: 'name', client_email: 'email@example.com' }
  end
end
