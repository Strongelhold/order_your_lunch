require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'date' do
    it 'must be uniq' do
      create :menu
      expect(Menu.new(date: Date.today.monday)).not_to be_valid
    end
  end

  describe 'orders_total_price method' do
    let(:menu) { create :menu_with_order }

    it 'return total price of orders' do
      expect(menu.orders_total_price).to eq menu.orders.map(&:total_price).reduce(:+)
    end
  end
end
