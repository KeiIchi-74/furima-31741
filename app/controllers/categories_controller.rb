class CategoriesController < ApplicationController
  before_action :set_categories, only: :show
  def index
    @categories = Category.where.not(id: 1)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.order(created_at: :desc).where(category_id: @category.id).page(params[:page]).per(120)
  end

  private

  def set_categories
    @categories = Category.all
  end

end