class AddsProduct
  def initialize(product_params: nil, store_id: nil)
    @product = Product.new(product_params.merge(store_id: store_id))
    @repo = Repository.for(:product)
  end

  def add
    if product.valid?
      repo.save(product).value
    else
      product.value
    end
  end

  private
  attr_reader :product, :repo
end
