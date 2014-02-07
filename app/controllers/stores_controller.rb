class StoresController < ApplicationController

  before_filter :is_in_store

  def index
  end

  def show
    binding.pry
    @products = current_store.products
  end
end
