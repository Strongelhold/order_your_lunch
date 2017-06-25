require 'rails_helper'

RSpec.describe MenusController, type: :controller do

  describe '#index' do
    context 'if user not signed in' do
      before do
        get :index
      end

      it 'redirect to log in page if user not logged in' do
        expect(subject).to redirect_to new_user_session_path
      end
    end
    context 'if user signed in' do
      let(:user) { create :user }

      before do
        sign_in user
        get :index
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end
      it 'return weekdays only for current week' do
        create :menu, date: Date.today.monday
        create :menu, date: Date.today.monday + 1
        expect(assigns(:menus)).to eq Menu.for_week
      end
    end
  end

end
