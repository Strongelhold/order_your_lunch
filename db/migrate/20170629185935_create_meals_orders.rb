class CreateMealsOrders < ActiveRecord::Migration
  def change
    create_table :meals_orders, id: false do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :order, index: true
    end
  end
end
