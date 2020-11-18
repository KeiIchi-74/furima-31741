class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:comment).merge(user_id: current_user.id)
  end

end