class StoresController < ApplicationController

  before_filter :is_in_store

  def index
  end

  def show
    @products = current_store.products
  end
end
