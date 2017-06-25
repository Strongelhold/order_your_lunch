class AddCourseFieldToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :course, :integer, default: 0
  end
end
