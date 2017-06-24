require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'for first user' do
    let(:user) { create :user }

    it 'have admin role' do
      expect(user.admin?).to be true
    end
  end

  describe 'if more than one' do
    let!(:user) { create :user }
    let(:another_user) { create :user, email: Faker::Internet.email }

    it 'second user have not admin role' do
      expect(another_user.admin?).to be false
    end
  end

end
