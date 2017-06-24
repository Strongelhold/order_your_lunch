class Meal < ActiveRecord::Base
  belongs_to :menu

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def price
    self[:price] / 100.0
  end

  def price=(value)
    self[:price] = value * 100
  end
end
