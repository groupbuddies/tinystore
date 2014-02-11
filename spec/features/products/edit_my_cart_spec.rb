require 'spec_helper'

feature 'Edit my cart' do
  let!(:user) { create(:user) }
  let!(:store) { setup_store }

  before(:each) do
    create_list(:product, 2, store: store)
  end

  scenario 'Add a product' do
    visit store_path

    expect {
      all('.product').first.click_on I18n.t('products.add_to_cart')
    }.to change { find('.js-cart-toggler') }
  end
end
