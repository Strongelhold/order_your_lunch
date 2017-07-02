class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @users = User.order(:id).all[1..-1] # except admin user
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
