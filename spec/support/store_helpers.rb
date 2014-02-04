module StoreHelpers

  attr_accessor :current_store

  def setup_store
    user = create :user
    login_as(user)
    switch_to_subdomain(user.store.slug)
    user.store
  end

  def switch_to_subdomain(subdomain)
    subdomain = "#{subdomain}." unless subdomain.empty?
    Capybara.app_host = "http://#{subdomain}#{DEFAULT_HOST}:#{DEFAULT_PORT}"
  end
end
