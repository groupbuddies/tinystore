FactoryGirl.define do

  factory :user do
    sequence(:name) { |i| "#{i} user" }
    sequence(:email) { |i| "#{i}@email.com" }
    password 'password'

    factory :confirmed_user do
      confirmed_at { Time.now }
    end
  end

end
