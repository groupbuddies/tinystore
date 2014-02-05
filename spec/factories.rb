FactoryGirl.define do

  factory :user do
    sequence(:name) { |i| "#{i} user" }
    sequence(:email) { |i| "#{i}@email.com" }
    password 'password'
    confirmed_at { Time.now }
    store

    factory :user_with_store do
      confirmed_at { Time.now }
      store
    end
  end

  factory :store do
    sequence(:name) { |i| "#{i} store" }
    sequence(:email) { |i| "#{i}@store.com" }
    sequence(:slug) { |i| "#{i}slug" }
  end

end
