RSpec.describe 'Menus', type: :feature do
  subject { page }

  let(:user) { create :user }
  let!(:menu) { create :menu }

  before do
    visit new_user_session_path
    fill_in 'Email' , with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'index page' do
    before { visit menus_path }

    it 'have menu list' do
      # page.should have_css('h2', text: "#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})")
      expect(page).to have_link("#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})", href: menu_path(menu))
    end
  end
end
