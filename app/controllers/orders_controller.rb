class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save
      redirect_to controller: :items, action: :index
    else
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(
      :postal_code, 
      :prefecture_id, 
      :city, :house_number, 
      :building_name, 
      :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
