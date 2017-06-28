FactoryGirl.define do
  factory :menu do
    date Date.today.monday

    transient do
      meals_count 5
    end

    after (:create) do |menu, evaluator|
      create_list(:meal, evaluator.meals_count, menu: menu)
    end
  end
end
