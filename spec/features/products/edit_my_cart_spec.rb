require 'spec_helper'

feature 'Edit my cart' do
  let!(:user) { create(:user) }
  let!(:store) { setup_store(user) }

  before(:each) do
    create_list(:product, 2, store: store)
  end

  scenario 'Add a product' do
    visit store_path

    expect {
      all('.product').first.find(I18n.t('products.add_to_cart')).click
    }.to change { find('#cart_count') }.by(1)
  end
end
