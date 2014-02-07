require 'spec_helper'

feature 'Edit a product' do
  let!(:store) { setup_store }
  let(:product) { create(:product, store: store) }

  before(:all) do
    PriceInput
    ImageWithPreviewInput
  end

  scenario 'Edit with valid data' do
    visit edit_manager_product_path(product)

    within 'form' do
      fill_in :product_name, with: 'New name'
      form_submit
    end

    page.should have_flash :notice
  end

  scenario 'With invalid data' do
    visit edit_manager_product_path(product)

    within 'form' do
      fill_in :product_name, with: ''
      form_submit
    end

    page.should have_form_errors
  end
end
