class GetsProducts
  def initialize(store_id: nil)
    @store_id = store_id
    @repo = Repository.for(:product)
  end

  def all
    if store_id
      repo.all_products_for(store_id: store_id)
    else
      repo.all
    end
  end

  def find_by_id(id)
    repo.find_by_id(id)
  end

  private
  attr_reader :repo, :store_id
end
