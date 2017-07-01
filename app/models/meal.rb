class Meal < ActiveRecord::Base
  belongs_to :menu
  has_and_belongs_to_many :orders

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true

  enum course: %i(starter main drink)

  def price
    self[:price] / 100.0
  end

  def price=(value)
    self[:price] = value * 100
  end
end
