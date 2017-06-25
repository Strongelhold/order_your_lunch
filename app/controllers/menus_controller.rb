class MenusController < ApplicationController
  before_action :require_login

  def index
    @menus = Menu.for_week
  end

  def show
  end

  private

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
