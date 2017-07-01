FactoryGirl.define do
  factory :order do
    user
    menu

    transient do
      meals_count 3
    end

    after(:create) do |order, evaluator|
      create_list(:meal, evaluator.meals_count, orders: [order])
    end
    after(:build) do |order, evaluator|
      create_list(:meal, evaluator.meals_count, orders: [order])
    end
  end
end
