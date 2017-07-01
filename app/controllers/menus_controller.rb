class MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus = Menu.for_week
  end

  def show
    @menu = Menu.find(params[:id])
    @meals = @menu.meals
  end
end
