require 'spec_helper'

feature 'Sign Up' do
  scenario 'with valid data' do
    visit new_user_registration_path

    within 'form' do
      fill_in :registration_form_name, with: 'Miguel Palhas'
      fill_in :registration_form_email, with: 'an@email.com'
      fill_in :registration_form_password, with: 'a_password'
      fill_in :registration_form_password_confirmation, with: 'a_password'
      click_on I18n.t('registrations.new.submit')
    end

    page.should have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
  end

  scenario 'with empty password' do
    visit new_user_registration_path

    within 'form' do
      fill_in :registration_form_name, with: 'Miguel Palhas'
      fill_in :registration_form_email, with: 'anemail.com'
      click_on I18n.t('registrations.new.submit')
    end

    page.should have_css '.inline-errors'
  end

  scenario 'with existing email' do
    created_user = create(:user)

    visit new_user_registration_path

    within 'form' do
      fill_in :registration_form_name, with: 'Miguel Palhas'
      fill_in :registration_form_email, with: created_user.email
      fill_in :registration_form_password, with: 'a_password'
      fill_in :registration_form_password_confirmation, with: 'a_password'
      click_on I18n.t('registrations.new.submit')
    end

    page.should have_css '.inline-errors'
  end
end
