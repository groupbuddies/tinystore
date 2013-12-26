RSpec.configure do |config|
  config.before(:all) do
    if Object.const_defined? :I18n
      I18n.enforce_available_locales = true
    end
  end
end
require 'pry'
require 'repository'
require 'repositories/stores/memory'
require 'repositories/products/memory'
require 'repositories/baskets/memory'

Repository.register :store, Repositories::Stores::Memory.new
Repository.register :product, Repositories::Products::Memory.new
Repository.register :basket, Repositories::Baskets::Memory.new
