class UnmarksProducts
  def initialize(product_id: nil, customer_id: nil)
    @product_id = product_id
    @customer_id = customer_id
    @repo = Repository.for(:basket)
  end

  def unmark
    repo.remove(product_id: product_id, customer_id: customer_id)
  end

  private
  attr_reader :product_id, :customer_id, :repo
end
