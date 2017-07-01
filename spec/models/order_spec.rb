require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'meals in order' do
    let(:meals) { create_list :meal, 3, course: 2 }

    it 'must be uniq by course' do
      order = Order.new(meals: meals)
      expect(order).not_to be_valid
    end
  end

  context 'presence validations' do
    let(:order) { build :order }
    it 'has user' do
      order.user_id = nil
      expect(order).not_to be_valid
    end
    it 'has menu' do
      order.menu_id = nil
      expect(order).not_to be_valid
    end
  end

end
