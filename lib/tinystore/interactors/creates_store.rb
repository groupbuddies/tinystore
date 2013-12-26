class CreatesStore
  def initialize(store_params: nil)
    @store = Store.new(store_params)
    @repo = Repository.for(:store)
  end

  def create
    if store.valid?
      repo.save(store).value
    else
      store.value
    end
  end

  private
  attr_reader :store, :repo
end
