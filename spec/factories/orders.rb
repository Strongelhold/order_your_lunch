FactoryGirl.define do
  factory :order do
    user
    menu

    transient do
      meals_count 3
    end

    before(:create) do |order, evaluator|
      order.meals << (create :meal, course: 0)
      order.meals << (create :meal, course: 1)
      order.meals << (create :meal, course: 2)
    end
  end
end
