require 'spec_helper'

describe CheckoutsController do

  describe 'GET /checkout' do

  end

  describe 'POST /checkout' do

  end

  it 'sends emails to both parties' do
    handler = subject.new(store, cart, checkout_info)

    handler.checkout
  end

  it 'does nothing when client data is incomplete' do
    handler = subject.new(store, cart, checkout_info)

    handler.checkout
  end

  it 'does nothing if there is no cart' do
    handler = subject.new(store, cart, checkout_info)

    handler.checkout
  end
end
