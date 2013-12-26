require 'entities/order'

class OrdersProducts

  def initialize(store_id: nil, customer_id: nil, email: nil)
    @store_id = store_id
    @customer_id = customer_id
    @email = email
    @repo = Repository.for(:order)
  end

  def order
    basket = GetsBaskets.new(store_id: store_id, customer_id: customer_id).basket
    order = Order.new(basket: basket, store_id: store_id, customer_id: customer_id, email: email)
    if order.valid?
      repo.save(order).value
    else
      order.value
    end
  end

  private
  attr_reader :repo, :store_id, :customer_id, :email
end
