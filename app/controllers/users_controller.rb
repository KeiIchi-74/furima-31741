class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categories

  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC")
    @favorites = @user.favorite_items.order("created_at DESC")
    @followings = @user.followings
    @followers = @user.followers
  end

  def follow
    user = User.find(params[:id])
    @followings = user.followings
    @followers = user.followers
  end

  private

  def set_categories
    @categories = Category.all
  end

end
