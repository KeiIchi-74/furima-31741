class ReportsController < ApplicationController
  before_action :set_item
  def create
    report = current_user.favorites.build(item_id: params[:item_id])
    report.save
  end

  def destroy
    report = Report.find_by(user_id: current_user.id, item_id: @item.id)
    report.destroy
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end