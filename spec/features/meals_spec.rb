RSpec.describe 'Meals', type: :feature do
  let(:user) { create :user }
  let(:menu) { create :menu }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe 'index page' do
    context 'if user not admin' do
      before do
        user.admin = false
        user.save
        visit menu_meals_path(menu)
      end

      it 'have list of meals' do
        expect(page).to have_css 'table'
        menu.meals.each do |meal|
          expect(page).to have_text meal.name
          expect(page).to have_text meal.course
          expect(page).to have_text meal.price
        end
      end

      it 'have "Submit" button' do
        expect(page).to have_link('Submit', user_orders_path(menu))
      end
    end
    context 'if user is admin and menu date today' do
      before { visit menu_meals_path(menu) }

      it 'have input fields to add new meal' do
        expect(page).to have_css('input')
        expect(page).to have_button('Add meal')
      end
    end
  end
end
