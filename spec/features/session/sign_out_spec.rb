require 'spec_helper'

feature 'Sign Out' do
  let(:password) { 'a_password' }
  let!(:user) { create(:user, password: password) }
  let!(:store) { setup_store_admin }

  scenario 'Sign out' do
    visit store_path

    click_on I18n.t('nav.sign_out')

    is_not_in_store(store)
  end
end
