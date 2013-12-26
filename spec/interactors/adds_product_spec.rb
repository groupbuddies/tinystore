require 'spec_helper'
require 'interactors/adds_product'

describe AddsProduct do
  let(:product_repo) { Repository.for(:product) }
  let(:store_repo) { Repository.for(:store) }
  let(:product_params) { { name: 'iphone', description: 'cenas', price: 600000 } }

  before :each do
    store_repo.clear
    product_repo.clear
  end


  it 'adds a product to a store' do
    expect {
      AddsProduct.new(product_params: product_params, store_id: store.id).add
    }.to change { product_repo.all_products_for(store_id: store.id).size }.by(1)
  end

  def store
    store_params = { name: "worton", description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" }
    @store ||= store_repo.save(Store.new(store_params))
  end

  context 'store association missing' do
    it 'does not create a product' do
      expect {
        AddsProduct.new(product_params: product_params).add
      }.not_to change { product_repo.all_products_for(store_id: store.id).size }
    end

    it 'returns the product value with errors' do
      invalid_product = AddsProduct.new(product_params: product_params).add

      expect(invalid_product).to include product_params
      expect(invalid_product[:errors]).not_to be_nil
    end
  end
end
