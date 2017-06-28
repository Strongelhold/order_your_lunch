RSpec.describe 'Menus', type: :feature do
  subject { page }

  let(:user) { create :user }
  let!(:menu) { create :menu }
  let(:menu_link) { "#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})" }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe 'index page' do
    before { visit menus_path }

    it 'have menu list with links to menu information' do
      expect(page).to have_link(menu_link, href: menu_meals_path(menu))
    end
  end
end
