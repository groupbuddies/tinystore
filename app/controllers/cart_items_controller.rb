class CartItemsController < ApplicationController
  before_filter :is_in_store
  
  respond_to :json, only: [:update]
  skip_before_filter :sanitize_cart, only: [:update]

  # POST /cart_items
  def create
    if cart_item = current_cart.items.where(product_id: create_cart_item_params[:product_id]).first
      cart_item.increment :amount, 1
      cart_item.save
    else
      current_cart.items.create(create_cart_item_params)
    end
    flash[:show_cart] = true
    redirect_to store_path
  end

  # PATCH /cart_items/:product_id/:product_amount
  def update
    existing_cart_item.update_attributes(update_cart_item_params)
    respond_with :ok
  end

  # DELETE /cart/:id
  def destroy
    existing_cart_item.destroy
    redirect_to store_path
  end

  private

  def existing_cart_item
    current_cart.items.where(id: params[:id]).first
  end

  def create_cart_item_params
    params.require(:cart_item).permit(:product_id, :amount)
  end

  def update_cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
