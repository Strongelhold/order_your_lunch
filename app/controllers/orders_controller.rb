class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    meals = Meal.find_by_ids(params[:meals])
    params_for_create = order_params
    params_for_create[:meals] = meals
    order = Order.new(params_for_create)
    if order.valid?
      order.save
      redirect_to menu_meals_path(order_params[:menu_id]), notice: 'Your order is processed'
    else
      redirect_to menu_meals_path(order_params[:menu_id]), alert: "#{order.decorated_errors}"
    end
  end

  private

  def order_params
    params.permit(:user_id, :menu_id, :meals)
  end

end
