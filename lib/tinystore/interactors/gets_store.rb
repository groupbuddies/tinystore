class GetsStore
  def initialize
    @repo = Repository.for(:store)
  end

  def all
    repo.all.map(&:value)
  end

  def find_by_id(id)
    repo.find_by_id(id).value
  end

  private
  attr_reader :repo
end
