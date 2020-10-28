class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_top, only: [:edit]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
    end 
  end

  private

  def item_params
    params.require(:item).permit(
      :image, 
      :name, 
      :info, 
      :category_id, 
      :sales_status_id, 
      :shipping_fee_id, 
      :prefecture_id, 
      :scheduled_delivery_id, 
      :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    @item = Item.find(params[:id])
    if user_signed_in?
      unless @item.user_id == current_user.id
        redirect_to root_path
      end
    end
  end

end
