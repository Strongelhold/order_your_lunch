FactoryGirl.define do
  factory :meal do
    price Faker::Number.decimal(3).to_f
    name Faker::Beer.name
  end
end
