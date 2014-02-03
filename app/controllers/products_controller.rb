class ProductsController < ApplicationController
  def new
    @product = current_store.products.build
  end
end
