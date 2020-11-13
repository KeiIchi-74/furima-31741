class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :save, :edit_ids, :delete_ids, :set_image]
  before_action :move_to_top, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :edit_ids, only: :update
  before_action :delete_ids, only: :update
  before_action :set_image, only: :update

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_images_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end 
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_images_params
    params.require(:item).permit(
      :name, 
      :info, 
      :category_id, 
      :sales_status_id, 
      :shipping_fee_id, 
      :prefecture_id, 
      :scheduled_delivery_id, 
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(
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

  def edit_ids_params
    params.require(:item).permit(edit_ids: []).merge(user_id: current_user.id)
  end

  def delete_ids_params
    params.require(:item).permit(delete_ids: []).merge(user_id: current_user.id)
  end

  def images_params
    params.require(:item).permit(images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    @item = Item.find(params[:id])
    if user_signed_in?
      if @item.user_id != current_user.id 
        redirect_to root_path
      elsif @item.order.present?
        redirect_to root_path
      end
    end
  end

  def edit_ids
    if edit_ids_params[:edit_ids].present?
      edit_ids_params[:edit_ids].each do |edit_id|
        image = @item.images.find(edit_id)
        image.purge
      end
    end
  end

  def delete_ids
    if delete_ids_params[:delete_ids].present?
      delete_ids_params[:delete_ids].each do |delete_id|
        image = @item.images.find(delete_id)
        image.purge
      end
    end
  end

  def set_image
    if images_params[:images].present?
      images_params[:images].each do |image|
        @item.images.attach(image)
      end
    end
  end

end
