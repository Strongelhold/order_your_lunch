FactoryGirl.define do
  factory :menu do
    date Date.today.monday

    transient do
      meals_count 5
    end

    after (:create) do |menu, evaluator|
      create_list(:meal, evaluator.meals_count, menu: menu)
    end

    factory :menu_with_order do
      after (:create) do |menu|
        create(:order, menu: menu)
      end
    end
  end
end
