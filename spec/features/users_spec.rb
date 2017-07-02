RSpec.describe 'Users', type: :feature do
  let!(:user) { create :user }
  let!(:users) { create_list :user, 10 }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe 'index page' do
    before { visit users_path }

    it 'have users without admin' do
      users.each do |user|
        expect(page).to have_link(user.name, user_path(user))
      end
    end
  end

  describe 'show page' do
    before { visit user_path(users.first) }

    it 'have name and email' do
      expect(page).to have_text users.first.name
      expect(page).to have_text users.first.email
    end
  end
end
