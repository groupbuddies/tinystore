require 'spec_helper'
require 'interactors/gets_baskets'
require 'fixtures/stores'

describe GetsBaskets do
  let(:product_repo) { Repository.for(:product) }

  before :each do
    Repository.for(:store).clear
    Repository.for(:basket).clear
    product_repo.clear
  end

  context '#basket' do
    it 'gets all products from a basket for a store' do
      first_product = product_repo.save(Product.new(product_params))
      second_product = product_repo.save(Product.new(product_params))
      customer_id = 'my_id'
      MarksProducts.new(product_id: first_product.id, customer_id: customer_id).mark
      MarksProducts.new(product_id: second_product.id, customer_id: customer_id).mark

      basket = GetsBaskets.new(store_id: store.id, customer_id: customer_id).basket
      basket.should =~ [first_product.id, second_product.id]
    end
  end

  context 'no customer id' do
    it 'returns nothing' do
      product = product_repo.save(Product.new(product_params))
      customer_id = 'my_id'
      MarksProducts.new(product_id: product.id, customer_id: customer_id).mark

      basket = GetsBaskets.new(store_id: store.id).basket

      basket.should be_empty
    end
  end

  context 'no store id' do
    it 'returns nothing' do
      product = product_repo.save(Product.new(product_params))
      customer_id = 'my_id'
      MarksProducts.new(product_id: product.id, customer_id: customer_id).mark

      basket = GetsBaskets.new(customer_id: customer_id).basket

      basket.should be_empty
    end
  end

  def product_params
    {
      name: 'iPhone',
      description: 'descrição',
      price: 6000000,
      store_id: store.id
    }
  end
end
