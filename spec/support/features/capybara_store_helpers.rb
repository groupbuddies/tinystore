module CapybaraStoreHelpers
  attr_accessor :current_store

  def setup_store_admin(user = create(:user))
    switch_to_subdomain(user.store.slug)
    login_as(user)
    user.store
  end

  def setup_store(user = nil)
    store = create(:store)
    switch_to_subdomain(store.slug)
    store
  end

  def switch_to_subdomain(subdomain)
    subdomain = "#{subdomain}." unless subdomain.empty?
    Capybara.app_host = "http://#{subdomain}#{DEFAULT_HOST}:#{DEFAULT_PORT}"
  end

  def is_in_store(store)
    current_url.should match store.slug
  end

  def is_not_in_store(store)
    current_url.should_not match store.slug
  end
end
