require 'spec_helper'

feature 'Edit a product' do
  let(:store) { setup_store }
  let(:product) { create(:product, store: store) }

  before(:each) do
    PriceInput
    ImageWithPreviewInput
    setup_store
  end

  scenario 'Edit with valid data' do
    visit edit_manager_product_path(product)

    within 'form' do
      fill_in :product_name, with: 'New name'
      form_submit
    end

    has_notice_flash
  end

  scenario 'With invalid data' do
    visit edit_manager_product_path(product)

    within 'form' do
      fill_in :product_name, with: ''
      form_submit
    end

    has_form_errors
  end
end
