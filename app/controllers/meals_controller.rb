class MealsController < ApplicationController

  before_filter :sanitize_page_params, only: :create

  def index
    @menu = Menu.find_by(id: params[:menu_id])
    @meals = Meal.where(menu_id: params[:menu_id])
  end

  def create
    meal = Meal.new(meal_params)
    meal.menu_id = params[:menu_id]
    meal.save
    redirect_to menu_meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :course, :price)
  end

  def sanitize_page_params
    params[:meal][:price] = params[:meal][:price].to_f
  end
end
