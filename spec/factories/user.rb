FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password Faker::Internet.password(6)
  end
end
