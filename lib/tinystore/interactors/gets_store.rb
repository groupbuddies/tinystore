class GetsStore
  def initialize
    @repo = Repository.for(:store)
  end

  def all
    repo.all
  end

  def find_by_id(id)
    repo.find_by_id(id)
  end

  private
  attr_reader :repo
end
