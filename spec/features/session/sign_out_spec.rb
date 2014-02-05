require 'spec_helper'

feature 'Sign Out' do
  let(:password) { 'a_password' }
  let(:user) { create(:user_with_store, password: password) }

  before :each do
    user
    setup_store
  end

  scenario 'Sign out' do
    visit store_path
    
    click_on I18n.t('nav.sign_out')

    is_not_in_store(user.store)
  end
end
