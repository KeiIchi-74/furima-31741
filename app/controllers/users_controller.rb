class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC")
    @favorites = @user.favorites.order("created_at DESC")
    @followings = @user.followings
    @followers = @user.followers
  end

  def follow
    user = User.find(params[:id])
    @followings = user.followings
    @followers = user.followers
  end

end
