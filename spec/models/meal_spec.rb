require 'rails_helper'

RSpec.describe Meal, type: :model do
  let (:meal) { create :meal }
  describe 'price' do
    it 'must return calculated price' do
      expect(meal.price).to eq meal[:price] / 100.0
    end
    it 'must recalculate saved float value to integer' do
      meal.price = 234.12
      meal.save
      expect(meal[:price]).to eq 23412
    end
    it 'cant be less than zero' do
      meal.price = -23
      expect(meal).not_to be_valid
    end
  end
end
