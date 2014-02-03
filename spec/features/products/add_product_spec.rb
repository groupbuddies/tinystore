require 'spec_helper'

feature 'Add a product' do

  scenario 'No products yet' do
    user = create_and_log_user
    visit store_url(user.store)

    page.should have_css '.new-product'
  end
end
