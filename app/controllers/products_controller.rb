class ProductsController < ApplicationController

  # GET /products/:id
  def show
    @product = current_store.products.where(id: params[:id]).first
  end
end
