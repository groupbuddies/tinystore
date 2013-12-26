require 'spec_helper'
require 'interactors/creates_store'
require 'entities/store'
require 'serializers/raw'

describe CreatesStore do
  let(:repo) { Repository.for(:store) }
  let(:store_params) { { name: "worton", description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" } }

  before :each do
    repo.clear
  end

  it "creates a store" do
    expect {
      CreatesStore.new(store_params: store_params).create
    }.to change{repo.all.size}.by(1)
  end

  it "returns the store value" do
    expect(CreatesStore.new(store_params: store_params).create).to include store_params
  end

  context "store name is missing" do
    it "does not create a store" do
      no_name_store_params = { description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" }

      expect {
        CreatesStore.new(store_params: no_name_store_params).create
      }.not_to change{repo.all.size}
    end

    it "returns the store value with errors" do
      no_name_store_params = { description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" }
      invalid_store = CreatesStore.new(store_params: no_name_store_params).create

      expect(invalid_store).to include no_name_store_params
      expect(invalid_store[:errors]).not_to be_nil
    end
  end

  context "store name already exists" do
    it "does not create a store" do
      repo.save(Store.new(store_params))
      unsaved_store_params = { name: "worton", description: "sells stuff", owner_email: "owner@example.com", owner_password: "password" }

      expect {
        CreatesStore.new(store_params: unsaved_store_params).create
      }.not_to change{repo.all.size}
    end
  end
end
