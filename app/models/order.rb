class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_and_belongs_to_many :meals

  validates :user_id, presence: true
  validates :menu_id, presence: true
  validate :check_meals_uniq, on: :create

  private

  def check_meals_uniq
    unless meals.to_ary.uniq { |meal| meal.course }.size == meals.size
      errors.add(:meals, 'can be only 1 meal for every course')
    end
  end

end
