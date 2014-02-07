require 'spec_helper'

describe CartItemsController do
  let!(:user) { create(:user) }
  let!(:products) { create_list(:product, 2, store: user.store) }

  describe 'POST /cart_items' do
    it 'creates a cart if there is none' do
      expect {
        post :create, product_id: products[0].id
      }.to change { Cart.count }.by(1)
    end

    it 'reuses an existing cart' do
      stub_current_cart

      expect {
        post :create, product_id: products[1].id
      }.to_not change { Cart.count }
    end

    it 'adds products to the cart' do
      expect {
        post :create, product_id: products[0].id
      }.to change { CartItem.count }.by(1)
    end
  end

  describe 'DELETE /cart_items/:product_id' do
    it 'removes products to the cart' do
      cart = stub_current_cart

      expect {
        delete :destroy, id: cart.items.first.id
      }.to change { CartItem.count }.by(-1)
    end
  end

  describe 'PATCH /cart_item/:product_id' do
    it 'updates the amount' do
      cart = stub_current_cart

      expect {
        patch :update, id: cart.items.first.id, amount: 2
      }.to change { cart.items.first.amount }
    end
  end

  def stub_current_cart(cart = create(:cart_with_items))
    ApplicationController.any_instance.stub(:current_cart).and_return(cart)
    cart
  end
end
