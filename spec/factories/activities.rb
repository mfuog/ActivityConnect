FactoryGirl.define do
  factory :activity do
    association :author, factory: :user
    title Faker::Lorem.words(3)
    description Faker::Lorem.paragraph
  end
end
