require 'spec_helper'
require 'fixtures/products'
require 'fixtures/customers'
require 'interactors/unmarks_products'

describe UnmarksProducts do
  let(:basket_repo) { Repository.for(:basket) }

  it "unmarks a product" do
    MarksProducts.new(product_id: product.id, customer_id: customer.id).mark

    expect {
      UnmarksProducts.new(product_id: product.id, customer_id: customer.id).unmark
    }.to change { basket_repo.all_products_for(customer_id: customer.id).size }.by(-1)
  end

  context "customer id does not exist" do
    it "does nothing" do
      MarksProducts.new(product_id: product.id, customer_id: customer.id).mark

      expect {
        UnmarksProducts.new(product_id: product.id).unmark
      }.not_to change { basket_repo.all_products_for(customer_id: customer.id).size }
    end
  end

  context "product is not marked" do
    it "does nothing" do
      expect {
        UnmarksProducts.new(product_id: product.id, customer_id: customer.id).unmark
      }.not_to change { basket_repo.all_products_for(customer_id: customer.id).size }
    end
  end
end
