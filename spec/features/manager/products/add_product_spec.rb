require 'spec_helper'

feature 'Add a product' do
  let!(:store) { setup_store_admin }

  before(:each) do
    PriceInput
    ImageWithPreviewInput
  end

  scenario 'No products yet' do
    visit store_path

    page.should have_css '.new-product'
  end

  scenario 'Add a valid product' do
    visit new_manager_product_path

    within 'form' do
      fill_in :product_name, with: 'Apple Macbook Air'
      fill_in :product_price, with: '1.50'
      fill_in :product_description, with: 'Short description'
      form_submit
    end

    page.should have_css '.product-show'
  end

  scenario 'Add an invalid product' do
    visit new_manager_product_path

    within 'form' do
      form_submit
    end

    page.should have_form_errors
  end
end
