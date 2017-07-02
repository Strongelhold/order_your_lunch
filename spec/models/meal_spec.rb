require 'rails_helper'

RSpec.describe Meal, type: :model do
  include_examples 'validations', :meal

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

  describe 'course' do
    %i(starter? main? drink?).each do |type|
      it "respond to #{type} method" do
        expect(meal).to respond_to(type)
      end
    end
    %i(starter! main! drink!).each do |type|
      it "#{type} method change 'course' value" do
        expect(meal).to respond_to(type)
        meal.public_send(type)
        expect(meal.course).to eq type.to_s.sub('!','')
      end
    end
  end

  describe 'find_by_ids' do
    let(:meals) { create_list :meal, 3 }
    it 'return array with meals objects' do
      ids = meals.map(&:id)
      expect(Meal.find_by_ids(ids)).to eq meals
    end
  end

end
