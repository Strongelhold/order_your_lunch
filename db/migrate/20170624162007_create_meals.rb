class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :price, default: 0
      t.string :name, default: ''
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
