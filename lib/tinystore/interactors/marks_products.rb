require 'securerandom'

class MarksProducts
  def initialize(product_id: nil, customer_id: nil)
    @product_id = product_id
    @customer_id = customer_id
    @repo = Repository.for(:basket)
  end

  def mark
    generate_customer_id unless customer_id
    mark_product
    customer_id
  end

  private
  attr_reader :repo, :product_id, :customer_id

  def generate_customer_id
    @customer_id = SecureRandom.uuid
  end

  def mark_product
    if !repo.exists_for_customer?(customer_id: customer_id, product_id: product_id)
      repo.add(product_id: product_id, customer_id: customer_id)
    end
  end
end
