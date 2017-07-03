require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  let(:menu) { create :menu }

  describe '#index' do
    it 'return meals for current menu' do
      get :index, menu_id: menu
      expect(assigns(:meals)).to eq menu.meals
    end
  end

  describe '#create' do
    let(:params) { { name: 'Duck', price: 1234.0, course: 'main' } }
    let!(:count) { Meal.count }

    before { post :create, menu_id: menu, meal: params }

    it 'redirect to meals' do
      expect(subject).to redirect_to menu_meals_path(menu)
    end
    it 'create meal' do
      expect(Meal.count).to be > count
    end
  end

end
