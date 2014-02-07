require 'spec_helper'

feature 'Sign In' do
  let(:password) { 'a_password' }
  let!(:user) { create(:user, password: password) }

  scenario 'regular sign in' do
    visit new_user_session_path
    within 'form' do
      fill_in :user_email, with: user.email
      fill_in :user_password, with: password
      form_submit
    end

    current_url.should match user.store.slug
  end
end
