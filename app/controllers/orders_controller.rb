class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]
  before_action :authenticate_user!
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
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
    ).merge(
      user_id: current_user.id, 
      item_id: @item.id, 
      token: params[:token]
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: "jpy"
    )
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    end
    
    if @item.order.present?
      redirect_to root_path
    end
  end

end
