require 'entities/store'

def store
  store_repo = Repository.for(:store)
  store_params = { name: "worton", description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" }
  @_store ||= store_repo.save(Store.new(store_params))
end
