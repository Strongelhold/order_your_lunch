RSpec.describe 'Meals', type: :feature do
  subject{ page }

  let(:user) { create :user }
  let(:menu) { create :menu }

  before do
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  describe 'index page' do
    before { visit menu_meals_path(menu) }

    it 'have list of meals' do
      expect(page).to have_css 'table'
      menu.meals.each do |meal|
        expect(page).to have_text meal.name
        expect(page).to have_text meal.course
        expect(page).to have_text meal.price
      end
    end

    it 'have "Submit" button' do
      expect(page).to have_button('Submit')
    end
  end
end
