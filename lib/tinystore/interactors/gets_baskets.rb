require 'active_support/core_ext/object/try'

class GetsBaskets
  def initialize(store_id: nil, customer_id: nil)
    @store_id = store_id
    @customer_id = customer_id
    @repo = Repository.for(:basket)
  end

  def basket
    return [] unless store_id
    products_ids = repo.all_products_for(customer_id: customer_id)
    store_products(products_ids)
  end

  private
  attr_reader :repo, :store_id, :customer_id

  def store_products(ids)
    ids.map do |product_id|
      GetsProducts.new(store_id: store_id).find_by_id(product_id).try(:id)
    end.compact
  end
end
