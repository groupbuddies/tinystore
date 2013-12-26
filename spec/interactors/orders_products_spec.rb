require 'spec_helper'
require 'fixtures/products'
require 'fixtures/stores'
require 'fixtures/customers'
require 'interactors/orders_products'

describe OrdersProducts do
  let(:orders_repo) { Repository.for(:order) }

  before :each do
    orders_repo.clear
  end

  it 'places an order' do
    MarksProducts.new(product_id: product.id, customer_id: customer.id).mark

    expect {
      OrdersProducts.new(store_id: store.id, customer_id: customer.id, email: 'customer@example.com').order
    }.to change { orders_repo.all.size }.by(1)
  end

  it 'returns the order id' do
    MarksProducts.new(product_id: product.id, customer_id: customer.id).mark

    order = OrdersProducts.new(store_id: store.id, customer_id: customer.id, email: 'customer@example.com').order
    orders_repo.find_by_id(order[:id]).basket.should include product.id

  end

  it 'sends an email to the store owner' do
  end

  context 'no products in basket' do

  end
end
