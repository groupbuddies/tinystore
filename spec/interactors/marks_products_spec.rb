require 'spec_helper'
require 'interactors/marks_products'
require 'entities/customer'

describe MarksProducts do
  let(:basket_repo) { Repository.for(:basket) }
  let(:product_repo) { Repository.for(:product) }

  it 'marks a product for a customer' do
    expect {
      MarksProducts.new(product_id: product.id, customer_id: customer.id).mark
    }.to change { basket_repo.all_products_for(customer_id: customer.id).size }.by(1)
  end

  context "customer id doesn't exist" do
    it 'generates a customer id' do
      new_customer_id = MarksProducts.new(product_id: product.id, customer_id: nil).mark
      new_customer_id.should_not be_nil
    end

    it 'marks a product for a customer' do
      customer_id = MarksProducts.new(product_id: product.id).mark
      basket_repo.all_products_for(customer_id: customer_id).size.should eq 1
    end
  end

  context 'the product is already marked' do
    it 'does nothing' do
      customer_id = MarksProducts.new(product_id: product.id).mark
      expect {
        MarksProducts.new(product_id: product.id, customer_id: customer_id).mark
      }.not_to change { basket_repo.all_products_for(customer_id: customer_id).size }
    end
  end

  def product
    product_params = { name: 'iphone', description: 'cenas', price: 600000 }
    @_product ||= product_repo.save(Product.new(product_params))
  end

  def customer
    @_customer ||= Customer.new(id: 10)
  end
end
