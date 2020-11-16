class CategoriesController < ApplicationController
  before_action :set_categories
  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: params[:id]).order("created_at DESC")
  end

  private

  def set_categories
    @categories = Category.all
  end

end