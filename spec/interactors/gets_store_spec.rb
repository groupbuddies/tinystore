require 'spec_helper'
require 'interactors/gets_store'

describe GetsStore do
  let(:repo) { Repository.for(:store) }
  let(:store_params) { { name: "worton", description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" } }

  before :each do
    repo.clear
  end

  it "gets all the stores" do
    first_store = repo.save(Store.new store_params)
    second_store = repo.save(Store.new store_params)

    GetsStore.new.all.should =~ [first_store, second_store]
  end

  it "gets a store by id" do
    first_store = repo.save(Store.new store_params)

    expect(GetsStore.new.find_by_id(first_store.id)).to eq first_store
  end
end
