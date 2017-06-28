require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  let(:menu) { create :menu }

  describe '#index' do
    it 'return meals for current menu' do
      get :index, menu_id: menu
      expect(assigns(:meals)).to eq menu.meals
    end
  end

end
