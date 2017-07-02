require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create :user }
  let!(:users) { create_list :user, 10 }

  describe '#index' do
    context 'user signed in and user is admin' do
      before do
        sign_in user
        get :index
      end
      it 'return list of users' do
        expect(assigns(:users)).to eq users
      end
    end

    context 'user not signed in' do
      before do
        get :index
      end
      it 'redirect to sign in' do
        expect(subject).to redirect_to new_user_session_path
      end
    end
  end

  describe '#show' do
    context 'user signed in and user is admin' do
      before do
        sign_in user
        get :show, id: users.first
      end
      it 'return list of users' do
        expect(assigns(:user)).to eq users.first
      end
    end

    context 'user not signed in' do
      before do
        get :show, id: users.first
      end
      it 'redirect to sign in' do
        expect(subject).to redirect_to new_user_session_path
      end
    end
  end
end
