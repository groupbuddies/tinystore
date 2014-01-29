require 'spec_helper'

feature 'Sign Up' do
  scenario 'with valid data' do
    visit new_user_registration_path

    within 'form' do
      fill_user_data
      fill_store_data
      form_submit
    end

    has_notice_flash
  end

  scenario 'with empty password' do
    visit new_user_registration_path

    within 'form' do
      fill_in :user_name, with: 'Miguel Palhas'
      fill_in :user_email, with: 'anemail.com'
      fill_store_data
      form_submit
    end

    has_form_errors
  end

  scenario 'with existing email' do
    created_user = create(:user)

    visit new_user_registration_path

    within 'form' do
      fill_in :user_email, with: created_user.email
      fill_store_data
      click_on I18n.t('registrations.new.submit')
    end

    has_form_errors
  end

  private

  def fill_user_data
    fill_in :user_name, with: 'Miguel Palhas'
    fill_in :user_email, with: 'an@email.com'
    fill_in :user_password, with: 'a_password'
    fill_in :user_password_confirmation, with: 'a_password'
  end

  def fill_store_data
    fill_in :user_store_name, with: 'My Store'
    fill_in :user_store_slug, with: 'mystore'
    fill_in :user_store_email, with: 'store@email.com'
    fill_in :user_store_description, with: 'A description'
  end
end
