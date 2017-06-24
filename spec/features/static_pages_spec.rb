RSpec.describe 'StaticPages', type: :feature do

  subject { page }

  describe 'home page' do
    context 'unless user signed in' do
      it 'have "Sign In" link' do
        visit root_path
        expect(page).to have_link('Sign In', href: new_user_session_path)
      end
    end

    context 'if user signed in' do
      let(:user) { create :user }
      before do
        visit new_user_session_path
        fill_in 'Email' , with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end
      it 'have "Sing Out" link' do
        visit root_path
        expect(page).to have_link('Sign Out', href: destroy_user_session_path)
      end
    end
  end
end
