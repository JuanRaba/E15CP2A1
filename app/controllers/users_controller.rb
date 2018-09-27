class UsersController < ApplicationController
  #before_action :authenticate_admin!
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def addtoadmin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def removeadmin
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
    redirect_to users_path
  end

  private
  def authenticate_admin!
    redirect_to root_path, alert: 'You are not ADMIN gtfo.' unless helpers.current_user.try(:admin)
  end
end
