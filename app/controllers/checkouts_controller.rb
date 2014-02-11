class CheckoutsController < ApplicationController

  def new
    if current_cart.items.empty?
      redirect_to store_path, error: t('checkout.new.empty')
    end
    @checkout = new_checkout
  end

  def create
    @checkout = new_checkout
    if @checkout.update_attributes(checkout_params)
      redirect_to store_path, notice: t('checkout.create.success')
    else
      render :new
    end
  end

  private

  def new_checkout
    Checkout.new(store: current_store, cart: current_cart)
  end

  def checkout_params
    params.require(:checkout).permit(:client_name, :client_email, :notes)
  end
end
