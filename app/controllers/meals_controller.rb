class MealsController < ApplicationController
  def index
    @meals = Meal.where(menu_id: params[:menu_id])
  end
end
