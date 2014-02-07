FactoryGirl.define do

  factory :user do
    sequence(:name) { |i| "#{i} user" }
    sequence(:email) { |i| "#{i}@email.com" }
    password 'password'
    confirmed_at { Time.now }
    store
  end

  factory :store do
    sequence(:name) { |i| "#{i} store" }
    sequence(:email) { |i| "#{i}@store.com" }
    sequence(:slug) { |i| "#{i}slug" }
  end

  factory :product do
    sequence(:name) { |i| "#{i} product" }
    price '2.50'
    sequence(:description) { |i| "#{i} description" }
  end

  factory :cart do
    factory :cart_with_items do
      after(:create) do |cart|
        create_list(:cart_item, 2, cart: cart)
        cart
      end
    end
  end

  factory :cart_item do
    product
    amount 1
  end
end
