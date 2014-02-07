ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'factory_girl'
require 'pry-rails'
require 'database_cleaner'
FactoryGirl.find_definitions

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Capybara.javascript_driver = :webkit

DEFAULT_HOST = 'lvh.me'
DEFAULT_PORT = 9887

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include I18n
  config.include WardenHelpers, type: :feature
  config.include FactoryGirl::Syntax::Methods
  config.include FormHelpers, type: :feature
  config.include CapybaraStoreHelpers, type: :feature
  config.include Devise::TestHelpers, type: :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
    Warden.test_mode!
  end

  config.before(:each) do
    DatabaseCleaner.start
    Warden.test_reset!
  end

  config.before(:each, type: :feature) do
    Capybara.default_host = "http://#{DEFAULT_HOST}"
    Capybara.server_port = DEFAULT_PORT
    Capybara.app_host = "http://#{DEFAULT_HOST}:#{DEFAULT_PORT}"
  end

  config.before(:each, type: :controller) do
    user = create(:user)
    sign_in user
    @original_host ||= @request.host
    @request.host = "#{user.store.slug}.#{@original_host}"
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
