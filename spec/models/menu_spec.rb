require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'date' do
    it 'must be uniq' do
      create :menu
      expect(Menu.new(date: Date.today.monday)).not_to be_valid
    end
  end
end
