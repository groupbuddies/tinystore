require 'entities/product'

def product
  product_repo = Repository.for(:product)
  product_params = { name: 'iphone', description: 'cenas', price: 600000 }
  @_product ||= product_repo.save(Product.new(product_params))
end
