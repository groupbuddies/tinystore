require 'spec_helper'

feature 'Sign In' do
  let(:password) { 'a_password' }
  let(:user) { create(:confirmed_user, password: password) }

  before :each do
    user
  end

  scenario 'regular sign in' do
    visit new_user_session_path
    within 'form' do
      fill_in :user_email, with: user.email
      fill_in :user_password, with: password
      form_submit
    end

    has_notice_flash
  end
end
