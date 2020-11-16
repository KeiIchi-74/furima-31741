class CategoriesController < ApplicationController
  before_action :set_categories
  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.order("created_at DESC").page(params[:page]).per(120)
  end

  private

  def set_categories
    @categories = Category.all
  end

end