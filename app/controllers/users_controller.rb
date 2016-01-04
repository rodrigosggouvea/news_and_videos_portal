class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def home
    @user = User.find params[:id]
  end

  def ban
    @user = User.find(params[:id])
    if @user.banned?
      @user.update(banned: false)
    else
      @user.update(banned: true)
    end
    redirect_to users_path
  end

  def set_admin
    @user = User.find(params[:id])
    if @user.admin?
      @user.update(admin: false)
    else
      @user.update(admin: true)
    end
    redirect_to users_path
  end
end
