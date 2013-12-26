require 'spec_helper'
require 'interactors/gets_products'
require 'entities/product'

describe GetsProducts do
  let(:product_repo) { Repository.for(:product) }
  let(:store_repo) { Repository.for(:store) }

  before :each do
    product_repo.clear
    store_repo.clear
  end

  context '#all' do
    it 'gets all products' do
      first_product = product_repo.save(Product.new(product_params))
      second_product = product_repo.save(Product.new(product_params))

      GetsProducts.new.all.should =~ [first_product, second_product]
    end

    it 'gets all products for a store' do
      other_store_id = 10
      first_product = product_repo.save(Product.new(product_params))
      product_repo.save(Product.new(product_params.merge(store_id: other_store_id)))

      GetsProducts.new(store_id: first_product.store_id).all.should =~ [first_product]
    end
  end

  context '#find_by_id' do
    it 'gets a single product' do
      product = product_repo.save(Product.new(product_params))

      GetsProducts.new.find_by_id(product.id).should eq product
    end

    context 'non-existing id' do
      it 'returns nothing' do
        non_existing_id = 1
        GetsProducts.new.find_by_id(non_existing_id).should eq nil
      end
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

  def store_params
    {
      name: 'worton',
      description: 'sells stuff',
      owner_email: 'owner@example.com',
      owner_password: 'password'
    }
  end

  def store
    store_repo.save(Store.new(store_params))
  end
end
