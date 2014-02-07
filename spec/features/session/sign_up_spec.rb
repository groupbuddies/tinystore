require 'spec_helper'

feature 'Sign Up', js: true do
  before(:all) do
    SlugInput
    ImageWithPreviewInput
  end

  scenario 'with valid data' do
    visit new_user_registration_path

    within 'form' do
      fill_user_data
      next_step
      fill_store_data
      next_step
      form_submit
    end

    page.should have_flash(:notice)
  end

  scenario 'with empty password' do
    visit new_user_registration_path

    within 'form' do
      fill_in :user_name, with: 'Miguel Palhas'
      fill_in :user_email, with: 'an@email.com'
      next_step
      fill_store_data
      next_step
      form_submit
    end

    page.should have_form_errors
  end

  scenario 'with existing email' do
    created_user = create(:user)

    visit new_user_registration_path

    within 'form' do
      fill_in :user_email, with: created_user.email
      next_step
      fill_store_data
      next_step
      form_submit
    end

    page.should have_form_errors
  end

  private

  def next_step
    find_link(I18n.t('registrations.new.next')).click
  end

  def fill_user_data
    fill_in :user_name, with: 'Miguel Palhas'
    fill_in :user_email, with: 'an@email.com'
    fill_in :user_password, with: 'a_password'
    fill_in :user_password_confirmation, with: 'a_password'
  end

  def fill_store_data
    fill_in :user_store_attributes_name, with: 'My Store'
    fill_in :user_store_attributes_slug, with: 'mystore'
    fill_in :user_store_attributes_email, with: 'store@email.com'
    fill_in :user_store_attributes_description, with: 'A description'
  end
end
