class Menu < ActiveRecord::Base
  has_many :meals
  has_many :orders

  validates :date, uniqueness: true

  scope :for_week, -> (date_in_week = nil) {
    date_in_week = date_in_week || Date.today
    start_of_week = date_in_week.monday
    end_of_week = start_of_week + 4

    where('date >= :start_of_week and date < :end_of_week',
      start_of_week: start_of_week,
      end_of_week: end_of_week)
    .order(:date)
  }

  def orders_total_price
    orders.map(&:total_price).reduce(:+)
  end
end
