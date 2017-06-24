require 'rails_helper'

RSpec.describe User, type: :model do
  include_examples 'validations', :user

  let(:user) { create :user }

  describe 'for first user' do

    it 'have admin role' do
      expect(user.admin?).to be true
    end
  end

  describe 'if more than one' do
    let(:users) { create_list :user, 2 }

    it 'second user have not admin role' do
      expect(users.last.admin?).to be false
    end
  end


end
