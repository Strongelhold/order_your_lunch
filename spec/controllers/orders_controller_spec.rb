require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#create' do
    let(:drink) { create :meal, course: 2 }
    let(:starter) { create :meal, course: 0 }
    let(:main) { create :meal, course: 1 }
    let(:menu) { create :menu, meals: [drink, starter, main] }
    let(:meals) { [starter.id, main.id, drink.id] }
    let(:user) { create :user }
    let(:params) { { user_id: user.id, menu_id: menu.id, meals: meals } }

    before { sign_in user }

    shared_examples 'redirected to list of meals' do
      specify { expect(response).to redirect_to menu_meals_path(menu.id) }
    end

    context 'with valid params' do
      before do
        post :create, params
      end

      it_behaves_like 'redirected to list of meals'

      it 'changes number of orders' do
        init_value = Order.count
        post :create, params
        expect(Order.count).to be > init_value
      end
    end

    context 'with invalid params' do
      before do
        params[:meals] = []
        post :create, params
      end

      it_behaves_like 'redirected to list of meals'

      it 'not changes number of orders' do
        init_value = Order.count
        post :create, params
        expect(Order.count).to be == init_value
      end

    end
  end
end
