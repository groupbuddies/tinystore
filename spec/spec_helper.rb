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

Repository.register :store, Repositories::Stores::Memory.new
