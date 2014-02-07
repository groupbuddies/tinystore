module CartHelper
  def current_cart
    return nil unless current_store
    @current_cart ||= begin
      cart = current_store.carts.where(id: session[:cart_id]).first
      if cart.nil?
        cart = current_store.carts.create
        session[:cart_id] = cart.id
      end
      cart
    end
  end
end
