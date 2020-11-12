class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :save]
  before_action :move_to_top, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :edit_ids, only: :update
  before_action :delete_ids, only: :update
  before_action :set_item, only: :update

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
    @user = @item.user
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
    set_item
    if user_signed_in?
      if @item.user_id != current_user.id 
        redirect_to root_path
      elsif @item.order.present?
        redirect_to root_path
      end
    end
  end

  def edit_ids
    set_item
    if edit_ids_params.present?
      edit_ids_params.each do |edit_id|
        image = @item.images.find(edit_id)
        image.purge
      end
    end
  end

  def delete_ids
    set_item
    if delete_ids_params.present?
      delete_ids_params.each do |delete_id|
        image = @item.images.find(delete_id)
        image.purge
      end
    end
  end

  def set_image
    set_item
    if images_params.present?
      images_params.each do |image|
        @item.images.attach(image)
      end
    end
  end

end
