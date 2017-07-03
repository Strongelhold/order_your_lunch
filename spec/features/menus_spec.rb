RSpec.describe 'Menus', type: :feature do
  let(:user) { create :user }
  let!(:menu) { create :menu }
  let(:menu_link) { "#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})" }

  before do
    login_as(user, scope: :user, run_callbacks: false)
  end

  describe 'index page' do
    before { visit menus_path }

    it 'have menu list with links to menu information' do
      expect(page).to have_link(menu_link, href: menu_meals_path(menu))
    end

    context 'if user is admin' do
      it 'have list of orders' do
        expect(page).to have_css('table')
        menu.orders.each do |order|
          expect(page).to have_text order.user_name
        end
      end

      it 'menu have summary' do
        expect(page).to have_text "Total: #{menu.orders_total_price}"
      end
    end
  end
end
