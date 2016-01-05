class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def home
    @feeds = (@user.news + @user.videos).sort_by(&:created_at).reverse
  end

  def ban
    if @user.banned?
      @user.update(banned: false)
    else
      @user.update(banned: true)
    end
    redirect_to users_path
  end

  def set_admin
    if @user.admin?
      @user.update(admin: false)
    else
      @user.update(admin: true)
    end
    redirect_to users_path
  end

  def friend
    current_user.friendships.build(target: @user).save!
    redirect_to home_user_path @user
  end

  def unfriend
    Friendship.where(user: @user, target: current_user).destroy_all
    Friendship.where(user: current_user, target: @user).destroy_all
    redirect_to home_user_path @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
