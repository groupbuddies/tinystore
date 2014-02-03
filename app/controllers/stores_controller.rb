class StoresController < ApplicationController

  def show
    @products = current_store.products
  end
end
