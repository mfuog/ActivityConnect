FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender [:female, :male].sample
    role :care_recipient
    address "Capetown"
    password { Faker::Internet.password(8) }
  end
end
