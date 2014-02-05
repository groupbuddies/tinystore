class StoresController < ApplicationController

  before_filter :in_store?

  def show
    @products = current_store.products
  end
end
